import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semantic_kulkul/helpers/api_helper.dart';
import 'package:semantic_kulkul/helpers/snackbar_helper.dart';
import 'package:semantic_kulkul/models/populate_model.dart';
import 'package:semantic_kulkul/repositories/populate_repository.dart';
import 'package:semantic_kulkul/views/components/select_form_component.dart';

class PopulateController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final PopulateRepository _populateRepository =
      PopulateRepository(ApiHelper.getInstance());
  RxList<SelectItem> kabupatens = <SelectItem>[].obs;
  RxList<SelectItem> kecamatans = <SelectItem>[].obs;
  RxList<SelectItem> dimensions = <SelectItem>[].obs;
  RxBool loading = true.obs;
  RxString kabupaten = ''.obs;
  RxString kecamatan = ''.obs;
  RxString desa = ''.obs;
  RxString banjar = ''.obs;
  RxString puraDesa = ''.obs;
  RxString puraPuseh = ''.obs;
  RxString puraDalem = ''.obs;
  TextEditingController puraDesaController = TextEditingController();
  TextEditingController puraPusehController = TextEditingController();
  TextEditingController puraDalemController = TextEditingController();

  Rx<PopulateKulkul> kulkulDesa = PopulateKulkul().obs;
  Rx<PopulateKulkul> kulkulBanjar = PopulateKulkul().obs;
  Rx<PopulateKulkul> kulkulPuraDesa = PopulateKulkul().obs;
  Rx<PopulateKulkul> kulkulPuraPuseh = PopulateKulkul().obs;
  Rx<PopulateKulkul> kulkulPuraDalem = PopulateKulkul().obs;

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

    kulkulDesa.value.pengangge = ItemLang(lang: '', name: '');
    kulkulBanjar.value.pengangge = ItemLang(lang: '', name: '');
    kulkulPuraDesa.value.pengangge = ItemLang(lang: '', name: '');
    kulkulPuraPuseh.value.pengangge = ItemLang(lang: '', name: '');
    kulkulPuraDalem.value.pengangge = ItemLang(lang: '', name: '');

    kulkulDesa.value.rawMaterials = <ItemLang>[];
    kulkulBanjar.value.rawMaterials = <ItemLang>[];
    kulkulPuraDesa.value.rawMaterials = <ItemLang>[];
    kulkulPuraPuseh.value.rawMaterials = <ItemLang>[];
    kulkulPuraDalem.value.rawMaterials = <ItemLang>[];

    List.generate(4, (index) {
      kulkulDesa.value.rawMaterials.add(ItemLang(lang: '', name: ''));
      kulkulBanjar.value.rawMaterials.add(ItemLang(lang: '', name: ''));
      kulkulPuraDesa.value.rawMaterials.add(ItemLang(lang: '', name: ''));
      kulkulPuraPuseh.value.rawMaterials.add(ItemLang(lang: '', name: ''));
      kulkulPuraDalem.value.rawMaterials.add(ItemLang(lang: '', name: ''));
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

  void handleSelectJumlahKulkul(String value) {
    kulkul.value.number = value;
    kulkul.refresh();
  }

  void handleEditPengangge(String value) {
    kulkul.value.pengangge.name = value;
    kulkul.refresh();
  }

  void handleTogglePengangge(int value) {
    kulkul.value.pengangge.lang = (value == 0 ? 'id' : 'ban');
    kulkul.refresh();
  }

  void handleToggleRawMaterial(int index, int value) {
    kulkul.value.rawMaterials[index].lang = (value == 0 ? 'id' : 'ban');
    kulkul.refresh();
  }

  void handleEditRawMaterial(int index, String value) {
    kulkul.value.rawMaterials[index].name = value;
    kulkul.refresh();
  }

  void handleSelectDimension(int index, String value) {
    kulkul.value.dimensions[index] = value;
    kulkul.refresh();
  }
}
