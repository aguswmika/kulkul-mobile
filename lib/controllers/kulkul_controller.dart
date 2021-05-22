import 'package:get/get.dart';
import 'package:semantic_kulkul/helpers/snackbar_helper.dart';
import 'package:semantic_kulkul/models/kulkul_model.dart';
import 'package:semantic_kulkul/models/location_model.dart';
import 'package:semantic_kulkul/repositories/kulkul_repository.dart';
import 'package:semantic_kulkul/repositories/location_repository.dart';

class KulkulController extends GetxController {
  final KulkulRepository _kulkulRepository = KulkulRepository();
  final LocationRepository _locationRepository = LocationRepository();
  Rx<KulkulDesa> kulkulDesa = KulkulDesa().obs;
  Rx<Kulkul> kulkulBanjar = Kulkul().obs;
  RxList<LocationList> locations = <LocationList>[].obs;
  Rx<KulkulPura> kulkulPura = KulkulPura().obs;
  RxBool _loading = true.obs;
  RxBool _loadingKulkulBanjar = true.obs;
  RxBool _loadingLocation = true.obs;
  RxBool _loadingKulkulPura = true.obs;

  Future<void> fetchKulkulDesa(String id) async {
    this.loading = true;
    KulkulDesa result = await _kulkulRepository.getKulkulDesaById(id);

    if (_kulkulRepository.status == 'success') {
      kulkulDesa.value = result;
    } else {
      SnackbarHelper.error('Kesalahan', _kulkulRepository.message);
    }

    this.loading = false;
  }

  Future<void> fetchKulkulBanjar(String id) async {
    this.loadingKulkulBanjar = true;
    Kulkul result = await _kulkulRepository.getKulkulBanjarById(id);

    if (_kulkulRepository.status == 'success') {
      kulkulBanjar.value = result;
    } else {
      SnackbarHelper.error('Kesalahan', _kulkulRepository.message);
    }

    this.loadingKulkulBanjar = false;
  }

  Future<void> fetchKulkulPura(String id) async {
    this.loadingKulkulPura = true;
    KulkulPura result = await _kulkulRepository.getKulkulPuraById(id);

    if (_kulkulRepository.status == 'success') {
      kulkulPura.value = result;
    } else {
      SnackbarHelper.error('Kesalahan', _kulkulRepository.message);
    }

    this.loadingKulkulPura = false;
  }

  Future<void> fetchLocationById(String type, String id) async {
    this.loadingLocation = true;
    Map<String, dynamic> result =
        await _locationRepository.getAllById(type, id);

    if (_locationRepository.status == 'success') {
      locations.clear();

      if (result != null && result.isNotEmpty) {
        result.forEach((k, v) {
          List<Kabupaten> kabupaten = <Kabupaten>[];
          v.forEach((k2, v2) {
            List<KulkulList> kulkulList = <KulkulList>[];
            v2.forEach((v3) {
              kulkulList.add(KulkulList.fromMap(v3));
            });

            kabupaten.add(Kabupaten(title: k2, kulkulList: kulkulList));
          });

          locations.add(LocationList(title: k, kabupaten: kabupaten));
        });
      }
    } else {
      SnackbarHelper.error('Kesalahan', _locationRepository.message);
    }

    this.loadingLocation = false;
  }

  set loading(bool value) => this._loading.value = value;
  bool get loading => this._loading.value;

  set loadingKulkulBanjar(bool value) =>
      this._loadingKulkulBanjar.value = value;
  bool get loadingKulkulBanjar => this._loadingKulkulBanjar.value;

  set loadingKulkulPura(bool value) => this._loadingKulkulPura.value = value;
  bool get loadingKulkulPura => this._loadingKulkulPura.value;

  set loadingLocation(bool value) => this._loadingLocation.value = value;
  bool get loadingLocation => this._loadingLocation.value;
}
