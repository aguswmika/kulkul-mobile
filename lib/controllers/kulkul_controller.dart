import 'package:get/get.dart';
import 'package:semantic_kulkul/helpers/snackbar_helper.dart';
import 'package:semantic_kulkul/models/kulkul_model.dart';
import 'package:semantic_kulkul/repositories/kulkul_repository.dart';

class KulkulController extends GetxController {
  final KulkulRepository _kulkulRepository = KulkulRepository();
  Rx<KulkulDesa> kulkulDesa = KulkulDesa().obs;
  Rx<Kulkul> kulkulBanjar = Kulkul().obs;
  RxBool _loading = true.obs;
  RxBool _loadingKulkulBanjar = true.obs;
  RxInt _currentSlide = 0.obs;

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

  set loading(bool value) => this._loading.value = value;
  bool get loading => this._loading.value;

  set loadingKulkulBanjar(bool value) => this._loadingKulkulBanjar.value = value;
  bool get loadingKulkulBanjar => this._loadingKulkulBanjar.value;

  set currentSlide(int value) => this._currentSlide.value = value;
  int get currentSlide => this._currentSlide.value;
}
