import 'package:get/get.dart';
import 'package:semantic_kulkul/helpers/snackbar_helper.dart';
import 'package:semantic_kulkul/models/location_model.dart';
import 'package:semantic_kulkul/repositories/location_repository.dart';

class ExploreController extends GetxController {
  // KulkulRepository _repository = KulkulRepository();
  final LocationRepository _repositoryLocation = LocationRepository();
  RxList<Location> locations = <Location>[].obs;
  // List<Kulkul> _kulkulDesaList = List<Kulkul>().obs;
  // List<Kulkul> _kulkulBanjarList = List<Kulkul>().obs;
  // List<Kulkul> _kulkulPuraDesaList = List<Kulkul>().obs;
  // List<Kulkul> _kulkulPuraPusehList = List<Kulkul>().obs;
  // List<Kulkul> _kulkulPuraDalemList = List<Kulkul>().obs;
  // Rx<Kabupaten> _kulkulByKabupaten = Kabupaten().obs;
  RxBool _loading = true.obs;

  @override
  void onInit() {
    this.fetchLocations();

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

  set loading(bool value) => this._loading.value = value;
  bool get loading => this._loading.value;

  // Future<void> fetchAll() async {
  //   loading = true;
  //   await Future.wait([
  //     this.fetchKulkul('desa'),
  //     this.fetchKulkul('banjar'),
  //     this.fetchKulkul('puraDesa'),
  //     this.fetchKulkul('puraPuseh'),
  //     this.fetchKulkul('puraDalem'),
  //     this.fetchKulkul('puraDalem'),
  //     this.fetchKulkulByCategory()
  //   ]);
  //   loading = false;
  // }

  // Future<void> fetchByLocation(String key) async {
  //   loading = true;

  //   if (key == 'category') {
  //     await this.fetchKulkulByCategory();
  //   } else {
  //     await this.fetchKulkul(key);
  //   }

  //   loading = false;
  // }

  // Future<void> fetchKulkul(String key) async {
  //   try {
  //     KulkulResult result = await this._repository.getAll(location: key);
  //     if (result.status == 'success') {
  //       this.setKulkulList(key, result.data);
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  // Future<void> fetchKulkulByCategory() async {
  //   try {
  //     KulkulResultByKabupaten result = await this._repository.getByKabupaten();

  //     if (result.status == 'success') {
  //       this.kulkulByKabupaten = result.data;
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  // set kulkulByKabupaten(Kabupaten value) =>
  //     this._kulkulByKabupaten.value = value;

  // Kabupaten get kulkulByKabupaten => this._kulkulByKabupaten.value;

  // void setKulkulList(String key, List<Kulkul> data) {
  //   switch (key.toLowerCase()) {
  //     case 'desa':
  //       this._kulkulDesaList.addAll(data);
  //       break;
  //     case 'banjar':
  //       this._kulkulBanjarList.addAll(data);
  //       break;
  //     case 'puradesa':
  //       this._kulkulPuraDesaList.addAll(data);
  //       break;
  //     case 'purapuseh':
  //       this._kulkulPuraPusehList.addAll(data);
  //       break;
  //     case 'puradalem':
  //       this._kulkulPuraDalemList.addAll(data);
  //       break;
  //     default:
  //       this._kulkulDesaList.addAll(data);
  //       break;
  //   }
  // }

  // List<Kulkul> getKulkulList(String key) {
  //   switch (key.toLowerCase()) {
  //     case 'desa':
  //       return this._kulkulDesaList;
  //     case 'banjar':
  //       return this._kulkulBanjarList;
  //     case 'puradesa':
  //       return this._kulkulPuraDesaList;
  //     case 'purapuseh':
  //       return this._kulkulPuraPusehList;
  //     case 'puradalem':
  //       return this._kulkulPuraDalemList;
  //     default:
  //       return this._kulkulDesaList;
  //   }
  // }
}
