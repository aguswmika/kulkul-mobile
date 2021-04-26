import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:semantic_kulkul/helpers/snackbar_helper.dart';
import 'package:semantic_kulkul/models/param_model.dart';
import 'package:semantic_kulkul/repositories/search_repository.dart';

class SearchController extends GetxController {
  RxBool _loading = true.obs;
  final SearchRepository _searchRepository = SearchRepository();
  RxList<Output> outputs = <Output>[].obs;
  RxList<Filter> filters = <Filter>[].obs;
  RxString selectedOutput = ''.obs;
  final formKey = GlobalKey<FormState>();
  RxList<Search> search = <Search>[].obs;
  RxString query = ''.obs;

  @override
  void onInit() {
    fetchParam();
    super.onInit();
  }

  Future<void> fetchParam() async {
    this.loading = true;
    Param result = await _searchRepository.getParam();

    if (_searchRepository.status == 'success') {
      outputs.assignAll(result.output);
      filters.assignAll(result.filter);
    } else {
      SnackbarHelper.error('Kesalahan', _searchRepository.message);
    }

    this.loading = false;
  }

  void handleOutput(String value) {
    selectedOutput.value = value;
  }

  void handleFilter(bool value, index) {
    // filters[index];
    // filters.assign(filters.map((element) => {
    //   element.status
    // }));
    String category = filters[index].category;
    filters.assignAll(filters.map((Filter item) {
      if (item.category == category) {
        item.status = false;
      }

      return item;
    }).toList());
    filters[index].status = value;
    filters.refresh();
  }

  Future<void> handleSearch() async {
    if (search.isEmpty) {
      if (formKey.currentState.validate()) {
        EasyLoading.show(status: 'Loading...');
        loading = true;
        List<Search> result = await _searchRepository.search(
            output: selectedOutput.value, filters: filters);
        if (_searchRepository.status == 'success') {
          search.assignAll(result);

          query.value = _searchRepository.query;
          if (search.isEmpty) {
            SnackbarHelper.info('Informasi', 'Data tidak ditemukan');
          }
        } else {
          SnackbarHelper.error('Kesalahan', _searchRepository.message);
        }

        loading = false;
        EasyLoading.dismiss();
      }
    } else {
      selectedOutput.value = '';
      filters.forEach((item) {
        item.status = false;
      });

      filters.refresh();
      search.clear();
    }
  }

  set loading(bool value) => this._loading.value = value;
  bool get loading => this._loading.value;
}
