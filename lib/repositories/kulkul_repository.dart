import 'dart:convert';

import 'package:semantic_kulkul/helpers/config_helper.dart';
import 'package:http/http.dart';
import 'package:semantic_kulkul/models/kulkul_model.dart';
import 'package:semantic_kulkul/repositories/repository.dart';

class KulkulRepository extends Repository {
  final Client _api = Client();

  Future<KulkulDesa> getKulkulDesaById(String id) async {
    this.reset();

    KulkulDesa data;
    try {
      Response response = await _api.get(
          Uri.parse('${ConfigHelper.url}/v1/kulkul/$id/desa'),
          headers: {'Content-type': 'application/json'});

      // print(response.body);
      var result = json.decode(response.body);

      this.status = result['status'];
      this.message = result['message'];


      if (this.status == 'success') {
        data = KulkulDesa.fromMap(result['data']);
      }
    } catch (error) {
      this.status = 'fail';
      this.message = 'Something went wrong';

      print(error);
    }

    return data;
  }

  Future<Kulkul> getKulkulBanjarById(String id) async {
    this.reset();

    Kulkul data;
    try {
      Response response = await _api.get(
          Uri.parse('${ConfigHelper.url}/v1/kulkul/$id/banjar'),
          headers: {'Content-type': 'application/json'});

      var result = json.decode(response.body);

      this.status = result['status'];
      this.message = result['message'];

      if (this.status == 'success') {
        data = Kulkul.fromMap(result['data']);
      }
    } catch (error) {
      this.status = 'fail';
      this.message = 'Something went wrong';

      print(error);
    }

    return data;
  }

  Future<KulkulPura> getKulkulPuraById(String id) async {
    this.reset();

    KulkulPura data;
    try {
      Response response = await _api.get(
          Uri.parse('${ConfigHelper.url}/v1/kulkul/$id/pura'),
          headers: {'Content-type': 'application/json'});

      var result = json.decode(response.body);

      this.status = result['status'];
      this.message = result['message'];

      if (this.status == 'success') {
        data = KulkulPura.fromMap(result['data']);
      }
    } catch (error) {
      this.status = 'fail';
      this.message = 'Something went wrong';

      print(error);
    }

    return data;
  }
}
