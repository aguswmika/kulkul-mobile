import 'dart:convert';

import 'package:semantic_kulkul/helpers/config_helper.dart';
import 'package:http/http.dart';
import 'package:semantic_kulkul/models/category_model.dart';
import 'package:semantic_kulkul/repositories/repository.dart';

class CategoryRepository extends Repository {
  final Client _api = Client();
  String status;
  String message;

  Future<List<Category>> getAll({location}) async {
    this.reset();

    List<Category> data;
    try {
      Response api = await _api.get('${ConfigHelper.url}/v1/category',
          headers: {'Content-type': 'application/json'});

      var result = json.decode(api.body);
      if (result['status'] == 'success') {
        data = List<Category>();

        if (result['data'] != null) {
          result['data'].forEach((item) {
            data.add(Category.fromMap(item));
          });
        } else {
          this.message = result['message'];
        }
      }
    } catch (error) {
      print(error);
    }

    return data;
  }

  void reset() {
    this.status = null;
    this.message = null;
  }

  String getStatus() {
    return this.status;
  }

  String getMessage() {
    return this.message;
  }
}
