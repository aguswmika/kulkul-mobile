import 'package:get/get.dart';
import 'package:semantic_kulkul/helpers/snackbar_helper.dart';
import 'package:semantic_kulkul/models/location_model.dart';
import 'package:semantic_kulkul/repositories/location_repository.dart';

class DesaController extends GetxController {
  final LocationRepository _locationRepository = LocationRepository();
  RxString _id = ''.obs;
  RxBool _loading = true.obs;
  RxList<Desa> desas = <Desa>[].obs;

  @override
  void onInit() async {
    this.id = Get.parameters['id'];
    await this.fetchDesas();
    super.onInit();
  }

  Future<void> fetchDesas() async {
    this.loading = true;
    
    List<Desa> result = await this._locationRepository.getAllDesa(this.id);

    if (result != null) {
      this.desas.assignAll(result);
    } else {
      SnackbarHelper.error('Kesalahan', _locationRepository.message);
    }

    this.loading = false;
  }

  set id(String value) => this._id.value = value;
  set loading(bool value) => this._loading.value = value;

  String get id => this._id.value;
  bool get loading => this._loading.value;
}
