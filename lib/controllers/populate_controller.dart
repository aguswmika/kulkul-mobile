import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:semantic_kulkul/helpers/api_helper.dart';
import 'package:semantic_kulkul/helpers/snackbar_helper.dart';
import 'package:semantic_kulkul/models/populate_model.dart';
import 'package:semantic_kulkul/repositories/populate_repository.dart';
import 'package:semantic_kulkul/routes.dart';
import 'package:semantic_kulkul/views/components/select_form_component.dart';

class PopulateController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool loading = true.obs;

  final PopulateRepository _populateRepository =
      PopulateRepository(ApiHelper.getInstance());

  RxList<SelectItem> kabupatens = <SelectItem>[].obs;
  RxList<SelectItem> kecamatans = <SelectItem>[].obs;
  RxList<SelectItem> dimensions = <SelectItem>[].obs;
  RxList<SelectItem> directions = <SelectItem>[].obs;
  RxList<SelectItem> activities = <SelectItem>[].obs;

  RxString kabupaten = ''.obs;
  RxString kecamatan = ''.obs;
  RxString desa = ''.obs;
  RxString banjar = ''.obs;
  RxString puraDesa = ''.obs;
  RxString puraPuseh = ''.obs;
  RxList<String> puraDalem = <String>[].obs;

  TextEditingController puraDesaController = TextEditingController();
  TextEditingController puraPusehController = TextEditingController();
  TextEditingController puraDalemController = TextEditingController();

  Rx<PopulateKulkul> kulkulDesa = PopulateKulkul().obs;
  Rx<PopulateKulkul> kulkulBanjar = PopulateKulkul().obs;
  Rx<PopulateKulkul> kulkulPuraDesa = PopulateKulkul().obs;
  Rx<PopulateKulkul> kulkulPuraPuseh = PopulateKulkul().obs;
  Rx<PopulateKulkul> kulkulPuraDalem = PopulateKulkul().obs;

  RxString path = ''.obs;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() {
    kulkulDesa.value.number = '1';
    kulkulBanjar.value.number = '1';
    kulkulPuraDesa.value.number = '1';
    kulkulPuraPuseh.value.number = '1';
    kulkulPuraDalem.value.number = '1';

    kulkulDesa.value.direction = 'TidakTau';
    kulkulBanjar.value.direction = 'TidakTau';
    kulkulPuraDesa.value.direction = 'TidakTau';
    kulkulPuraPuseh.value.direction = 'TidakTau';
    kulkulPuraDalem.value.direction = 'TidakTau';

    kulkulDesa.value.pengangge = ItemLang(lang: 'ban', name: '');
    kulkulBanjar.value.pengangge = ItemLang(lang: 'ban', name: '');
    kulkulPuraDesa.value.pengangge = ItemLang(lang: 'ban', name: '');
    kulkulPuraPuseh.value.pengangge = ItemLang(lang: 'ban', name: '');
    kulkulPuraDalem.value.pengangge = ItemLang(lang: 'ban', name: '');

    kulkulDesa.value.rawMaterials = <ItemLang>[];
    kulkulBanjar.value.rawMaterials = <ItemLang>[];
    kulkulPuraDesa.value.rawMaterials = <ItemLang>[];
    kulkulPuraPuseh.value.rawMaterials = <ItemLang>[];
    kulkulPuraDalem.value.rawMaterials = <ItemLang>[];

    List.generate(4, (index) {
      kulkulDesa.value.rawMaterials.add(ItemLang(lang: 'id', name: ''));
      kulkulBanjar.value.rawMaterials.add(ItemLang(lang: 'id', name: ''));
      kulkulPuraDesa.value.rawMaterials.add(ItemLang(lang: 'id', name: ''));
      kulkulPuraPuseh.value.rawMaterials.add(ItemLang(lang: 'id', name: ''));
      kulkulPuraDalem.value.rawMaterials.add(ItemLang(lang: 'id', name: ''));
    });

    kulkulDesa.value.dimensions = <String>[];
    kulkulBanjar.value.dimensions = <String>[];
    kulkulPuraDesa.value.dimensions = <String>[];
    kulkulPuraPuseh.value.dimensions = <String>[];
    kulkulPuraDalem.value.dimensions = <String>[];

    List.generate(4, (index) {
      kulkulDesa.value.dimensions.add('');
      kulkulBanjar.value.dimensions.add('');
      kulkulPuraDesa.value.dimensions.add('');
      kulkulPuraPuseh.value.dimensions.add('');
      kulkulPuraDalem.value.dimensions.add('');
    });

    kulkulDesa.value.images = <File>[];
    kulkulBanjar.value.images = <File>[];
    kulkulPuraDesa.value.images = <File>[];
    kulkulPuraPuseh.value.images = <File>[];
    kulkulPuraDalem.value.images = <File>[];

    kulkulDesa.value.sounds = <Sound>[];
    kulkulBanjar.value.sounds = <Sound>[];
    kulkulPuraDesa.value.sounds = <Sound>[];
    kulkulPuraPuseh.value.sounds = <Sound>[];
    kulkulPuraDalem.value.sounds = <Sound>[];
  }

  Rx<PopulateKulkul> get kulkul {
    switch (Get.parameters['id']) {
      case 'desa':
        return kulkulDesa;
      case 'banjar':
        return kulkulBanjar;
      case 'puraDesa':
        return kulkulPuraDesa;
      case 'puraPuseh':
        return kulkulPuraPuseh;
      default:
        return kulkulPuraDalem;
    }
  }

  Future<void> fetchAllKabupaten() async {
    this.loading.value = true;

    List<SelectItem> result = await _populateRepository.getAllKabupaten();

    if (result != null) {
      this.kabupatens.assignAll(result);
    } else {
      SnackbarHelper.error('Kesalahan', _populateRepository.message);
    }

    this.loading.value = false;
  }

  Future<void> fetchAllKecamatan(String id) async {
    List<SelectItem> result = await _populateRepository.getAllKecamatan(id);
    if (result != null) {
      this.kecamatans.assignAll(result);
    } else {
      SnackbarHelper.error('Kesalahan', _populateRepository.message);
    }
  }

  Future<void> fetchAllDimension() async {
    List<SelectItem> result = await _populateRepository.getAllDimension();
    if (result != null) {
      this.dimensions.assignAll(result);
    } else {
      SnackbarHelper.error('Kesalahan', _populateRepository.message);
    }
  }

  Future<void> fetchAllDirection() async {
    List<SelectItem> result = await _populateRepository.getAllDirection();
    if (result != null) {
      this.directions.assignAll(result);
    } else {
      SnackbarHelper.error('Kesalahan', _populateRepository.message);
    }
  }

  Future<void> fetchAllActivity() async {
    List<SelectItem> result = await _populateRepository.getAllActivity();
    if (result != null) {
      this.activities.assignAll(result);
    } else {
      SnackbarHelper.error('Kesalahan', _populateRepository.message);
    }
  }

  void handleSelectKabupaten(String value) async {
    kecamatan.value = '';
    kabupaten.value = value;
    await fetchAllKecamatan(value);
  }

  void handleSelectKecamatan(String value) {
    kecamatan.value = value;
  }

  void handleEditDesa(String value) {
    desa.value = value;
    puraDesaController.text = 'Pura Desa ' + value;
    puraPusehController.text = 'Pura Puseh ' + value;
    puraDalemController.text = 'Pura Dalem ' + value;
  }

  void handleEditBanjar(String value) {
    banjar.value = value;
  }

  void handleSelectJumlahKulkul(String value) {
    kulkul.value.number = value;
    kulkul.refresh();
  }

  void handleEditPengangge(String value) {
    kulkul.value.pengangge.name = value;
    kulkul.refresh();
  }

  void handleTogglePengangge(int value) {
    kulkul.value.pengangge.lang = (value == 1 ? 'ban' : 'id');
    kulkul.refresh();
  }

  void handleToggleRawMaterial(int index, int value) {
    kulkul.value.rawMaterials[index].lang = (value == 1 ? 'ban' : 'id');
    kulkul.refresh();
  }

  void handleEditRawMaterial(int index, String value) {
    kulkul.value.rawMaterials[index].name = value;
    kulkul.refresh();
  }

  void handleButtonPuraDalem() {
    puraDalem.add('');
  }

  void handleEditPuraDalem(int index, String value) {
    puraDalem[index] = value;
  }

  void handleSelectDimension(int index, String value) {
    kulkul.value.dimensions[index] = value;
    kulkul.refresh();
  }

  void handleButtonGambar() {
    kulkul.value.images.add(File(''));
    kulkul.refresh();
  }

  void handlePickImage(int index, File value) {
    kulkul.value.images[index] = value;
    kulkul.refresh();
  }

  void handleButtonSuara() {
    Get.toNamed(Routes.PopulateKulkulSoundView,
        parameters: {'id': Get.parameters['id']});
  }

  void handleButtonAddSuara() {
    kulkul.value.sounds.add(Sound(
        name: TextEditingController(),
        activities: <Activity>[],
        lang: 'ban',
        type: 'Simulation',
        file: <File>[]));
    kulkul.refresh();
  }

  void handleToggleSoundNameLang(int index, int value) {
    kulkul.value.sounds[index].lang = (value == 1 ? 'ban' : 'id');
    kulkul.refresh();
  }

  void handleButtonRemoveSuara(int index) {
    kulkul.value.sounds.removeAt(index);
    kulkul.refresh();
  }

  void handleButtonAktivitas(int index) {
    kulkul.value.sounds[index].activities
        .add(Activity(name: TextEditingController(), group: '', lang: 'id'));
    kulkul.refresh();
  }

  void handleButtonRemoveAktivitas(int index, int indexAktivitas) {
    kulkul.value.sounds[index].activities.removeAt(indexAktivitas);
    kulkul.refresh();
  }

  void handleTogglAktivitas(int index, int indexAktivitas, int value) {
    kulkul.value.sounds[index].activities[indexAktivitas].lang =
        (value == 1 ? 'ban' : 'id');
    kulkul.refresh();
  }

  void handleSelectAktivitas(int index, int indexAktivitas, String value) {
    kulkul.value.sounds[index].activities[indexAktivitas].group = value;
    kulkul.refresh();
  }

  void handleButtonAddSuaraFile(int index) {
    kulkul.value.sounds[index].file.add(File(''));
    kulkul.refresh();
  }

  void handleButtonRemoveSuaraFile(int index, int indexSuara) {
    if (kulkul.value.sounds[index].file[indexSuara].path != null ||
        kulkul.value.sounds[index].file[indexSuara].path != '')
      kulkul.value.sounds[index].file[indexSuara].delete();
    kulkul.value.sounds[index].file.removeAt(indexSuara);
    kulkul.refresh();
  }

  void handleAudioSuaraFile(int index, int indexSuara, String value) {
    kulkul.value.sounds[index].file[indexSuara] = File(value);
    kulkul.refresh();
  }

  void saveKulkul() async {
    EasyLoading.show(status: 'Loading...');

    List<PopulateKulkul> datas = [
      kulkulDesa.value,
      kulkulBanjar.value,
      kulkulPuraDesa.value,
      kulkulPuraDalem.value,
      kulkulPuraPuseh.value,
    ];
    List<Map<String, String>> puraDalemMap = <Map<String, String>>[];

    puraDalemMap.add({'data': puraDalemController.text});

    puraDalem.forEach((element) {
      puraDalemMap.add({'data': element});
    });

    await _populateRepository.storeKulkul(datas, {
      'kabupaten': kabupaten.value,
      'kecamatan': kecamatan.value,
      'desa': desa.value,
      'banjar': banjar.value,
      'puraDesa': puraDesaController.text,
      'puraPuseh': puraPusehController.text,
      'puraDalem': puraDalemMap,
    });

    EasyLoading.dismiss();

    if (_populateRepository.status == 'success') {
        Get.back();
        SnackbarHelper.success('Berhasil',  _populateRepository.message);
      } else {
        SnackbarHelper.error('Kesalahan', _populateRepository.message);
      }
  }
}
