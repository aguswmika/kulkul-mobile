import 'dart:convert';

import 'package:semantic_kulkul/helpers/config_helper.dart';
import 'package:http/http.dart';
import 'package:semantic_kulkul/models/category_model.dart';
import 'package:semantic_kulkul/repositories/repository.dart';

class CategoryRepository extends Repository {
  final Client _api = Client();

  Future<List<Category>> getAll({location}) async {
    this.reset();

    List<Category> data;
    try {
      Response api = await _api.get(Uri.parse('${ConfigHelper.url}/v1/category'),
          headers: {'Content-type': 'application/json'});

      var result = json.decode(api.body);
      this.status = result['status'];
      this.message = result['message'];

      if (this.status == 'success') {
        data = <Category>[];

        if (result['data'] != null) {
          result['data'].forEach((item) {
            data.add(Category.fromMap(item));
          });
        }
      }
    } catch (error) {
      print(error);

      this.status = 'fail';
      this.message = 'Something went wrong';
    }

    return data;
  }
}
