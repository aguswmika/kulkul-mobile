import 'package:get/get.dart';
import 'package:semantic_kulkul/helpers/snackbar_helper.dart';
import 'package:semantic_kulkul/models/kulkul_model.dart';
import 'package:semantic_kulkul/repositories/kulkul_repository.dart';

class KulkulController extends GetxController {
  final KulkulRepository _kulkulRepository = KulkulRepository();
  Rx<KulkulDesa> kulkulDesa = KulkulDesa().obs;
  Rx<Kulkul> kulkulBanjar = Kulkul().obs;
  RxBool _loading = true.obs;
  RxInt _currentSlide = 0.obs;

  Future<void> fetchKulkulDesa() async {
    this.loading = true;
    KulkulDesa result =
        await _kulkulRepository.getKulkulDesaById(Get.parameters['id']);

    if (_kulkulRepository.status == 'success') {
      kulkulDesa.value = result;
    } else {
      SnackbarHelper.error('Kesalahan', _kulkulRepository.message);
    }

    this.loading = false;
  }

  Future<void> fetchKulkulBanjar() async {
    this.loading = true;
    Kulkul result =
        await _kulkulRepository.getKulkulBanjarById(Get.parameters['id']);

    if (_kulkulRepository.status == 'success') {
      kulkulBanjar.value = result;
    } else {
      SnackbarHelper.error('Kesalahan', _kulkulRepository.message);
    }

    this.loading = false;
  }

  set loading(bool value) => this._loading.value = value;
  bool get loading => this._loading.value;

  set currentSlide(int value) => this._currentSlide.value = value;
  int get currentSlide => this._currentSlide.value;
}
