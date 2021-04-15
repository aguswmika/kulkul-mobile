import 'package:get/get.dart';
import 'package:semantic_kulkul/helpers/snackbar_helper.dart';
import 'package:semantic_kulkul/models/category_model.dart';
import 'package:semantic_kulkul/repositories/category_repository.dart';

class CategoryController extends GetxController {
  final CategoryRepository _repository = CategoryRepository();
  RxList<Category> categories = <Category>[].obs;
  RxBool _loading = true.obs;

  @override
  void onInit() async {
    this.loading = true;

    await this.fetchCategories();

    this.loading = false;
    super.onInit();
  }

  bool get loading => this._loading.value;
  set loading(bool value) => this._loading.value = value;

  Future<void> fetchCategories() async {
    List<Category> result = await _repository.getAll();
    if (result != null) {
      categories.assignAll(result);
    } else {
      SnackbarHelper.error('Kesalahan', _repository.message);
    }
  }
}
