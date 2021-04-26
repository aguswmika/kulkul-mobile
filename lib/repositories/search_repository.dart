import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:semantic_kulkul/helpers/config_helper.dart';
import 'package:semantic_kulkul/models/param_model.dart';
import 'package:semantic_kulkul/repositories/repository.dart';

class SearchRepository extends Repository {
  final Client _api = Client();
  String query = '';

  Future<Param> getParam() async {
    Param data;

    this.reset();

    try {
      Response response = await _api.get(
          Uri.parse('${ConfigHelper.url}/v1/params'),
          headers: {'Content-type': 'application/json'});

      var result = json.decode(response.body);

      this.status = result['status'];
      this.message = result['message'];

      if (this.status == 'success') {
        data = Param.fromMap(result['data']);
      }
    } catch (e) {
      this.status = 'fail';
      this.message = 'Something went wrong';

      print(e);
    }

    return data;
  }

  Future<List<Search>> search(
      {@required String output, @required List<Filter> filters}) async {
    List<Search> data;

    this.reset();

    try {
      Map<String, String> bodyFilter = {};

      filters.forEach((item) {
        if (item.status) bodyFilter[item.category] = item.id;
      });

      Response response =
          await _api.post(Uri.parse('${ConfigHelper.url}/v1/search'),
              headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: json.encode({'output': output, 'filter': bodyFilter}));

      var result = json.decode(response.body);

      this.status = result['status'];
      this.message = result['message'];

      if (this.status == 'success') {
        data = <Search>[];

        if (result['data'] != null) {
          result['data'].forEach((item) {
            data.add(Search.fromMap(item));
          });

          this.query = result['query'];
        }
      }
    } catch (e) {
      this.status = 'fail';
      this.message = 'Something went wrong';

      print(e);
    }

    return data;
  }
}
