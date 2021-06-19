import 'package:get/get.dart';
import 'package:semantic_kulkul/helpers/snackbar_helper.dart';
import 'package:semantic_kulkul/models/location_model.dart';
import 'package:semantic_kulkul/repositories/location_repository.dart';

class ExploreController extends GetxController {
  // KulkulRepository _repository = KulkulRepository();
  final LocationRepository _repositoryLocation = LocationRepository();
  RxList<Location> locations = <Location>[].obs;
  RxList<Location> puraLocations = <Location>[].obs;
  RxBool _loading = true.obs;
  RxBool _loadingPura = true.obs;

  @override
  void onInit() {
    fetchLocations();
    super.onInit();
  }

  Future<void> fetchLocations() async {
    this.loading = true;

    List<Location> result = await _repositoryLocation.getAll();

    if (result != null)
      this.locations.assignAll(result);
    else {
      SnackbarHelper.error('Kesalahan', _repositoryLocation.message);
    }

    this.loading = false;
  }

  Future<void> fetchPuraLocations() async {
    this.loadingPura = true;

    List<Location> result = await _repositoryLocation.getAllPura();

    if (result != null)
      this.puraLocations.assignAll(result);
    else {
      SnackbarHelper.error('Kesalahan', _repositoryLocation.message);
    }

    this.loadingPura = false;
  }

  set loading(bool value) => this._loading.value = value;
  bool get loading => this._loading.value;

  set loadingPura(bool value) => this._loadingPura.value = value;
  bool get loadingPura => this._loadingPura.value;
}
