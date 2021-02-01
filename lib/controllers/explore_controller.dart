import 'package:get/get.dart';
import 'package:semantic_kulkul/models/kulkul_model.dart';
import 'package:semantic_kulkul/models/results/kulkul_result.dart';
import 'package:semantic_kulkul/repositoris/explore_repository.dart';

class ExploreController extends GetxController {
  ExploreRepository _repository = ExploreRepository();
  List<Kulkul> _kulkulDesaList = List<Kulkul>();
  List<Kulkul> _kulkulBanjarList = List<Kulkul>();
  List<Kulkul> _kulkulPuraDesaList = List<Kulkul>();
  List<Kulkul> _kulkulPuraPusehList = List<Kulkul>();
  List<Kulkul> _kulkulPuraDalemList = List<Kulkul>();

  Future<void> fetchKulkul(String key) async {
    try {
      KulkulResult result = await this._repository.getAll(location: key);
      if (result.status == 'success') {
        this.setKulkulList(key, result.data);
        update();
      }
    } catch (error) {
      print(error);
    }
  }

  void setKulkulList(String key, List<Kulkul> data) {
    switch (key.toLowerCase()) {
      case 'desa':
        this._kulkulDesaList.addAll(data);
        break;
      case 'banjar':
        this._kulkulBanjarList.addAll(data);
        break;
      case 'puradesa':
        this._kulkulPuraDesaList.addAll(data);
        break;
      case 'purapuseh':
        this._kulkulPuraPusehList.addAll(data);
        break;
      case 'puradalem':
        this._kulkulPuraDalemList.addAll(data);
        break;
      default:
        this._kulkulDesaList.addAll(data);
        break;
    }
  }

  List<Kulkul> getKulkulList(String key) {
    switch (key.toLowerCase()) {
      case 'desa':
        return this._kulkulDesaList;
      case 'banjar':
        return this._kulkulBanjarList;
      case 'puradesa':
        return this._kulkulPuraDesaList;
      case 'purapuseh':
        return this._kulkulPuraPusehList;
      case 'puradalem':
        return this._kulkulPuraDalemList;
      default:
        return this._kulkulDesaList;
    }
  }
}
