import 'package:get/get.dart';
import 'package:semantic_kulkul/helpers/snackbar_helper.dart';
import 'package:semantic_kulkul/models/location_model.dart';
import 'package:semantic_kulkul/repositories/location_repository.dart';

class DesaController extends GetxController {
  final LocationRepository _locationRepository = LocationRepository();
  RxBool _loading = true.obs;
  RxBool _loadingPura = true.obs;
  RxList<Desa> desas = <Desa>[].obs;
  RxList<Desa> puraDesas = <Desa>[].obs;

  Future<void> fetchAllDesa(String id) async {
    this.loading = true;
    
    List<Desa> result = await this._locationRepository.getAllDesa(id);

    if (result != null) {
      this.desas.assignAll(result);
    } else {
      SnackbarHelper.error('Kesalahan', _locationRepository.message);
    }

    this.loading = false;
  }

  Future<void> fetchAllPuraDesa(String id) async {
    this.loadingPura = true;
    
    List<Desa> result = await this._locationRepository.getAllPuraDesa(id);

    if (result != null) {
      this.puraDesas.assignAll(result);
    } else {
      SnackbarHelper.error('Kesalahan', _locationRepository.message);
    }

    this.loadingPura = false;
  }

  set loading(bool value) => this._loading.value = value;
  bool get loading => this._loading.value;
  set loadingPura(bool value) => this._loadingPura.value = value;
  bool get loadingPura => this._loadingPura.value;
}
