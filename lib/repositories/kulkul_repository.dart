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
      Response response = await _api.get(Uri.parse('${ConfigHelper.url}/v1/kulkul/$id/desa'),
          headers: {'Content-type': 'application/json'});

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
      Response response = await _api.get(Uri.parse('${ConfigHelper.url}/v1/kulkul/$id/banjar'),
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
  // Future<KulkulResult> getAll({location}) async {
  //   KulkulResult result;
  //   String _location = 'desa';
  //   try {
  //     if (location != null) {
  //       _location = location;
  //     }
  //     Response api = await _api.get(
  //         '${ConfigHelper.url}/v1/kulkul-location/$_location',
  //         headers: {'Content-type': 'application/json'});

  //     result = KulkulResult.fromMap(json.decode(api.body));
  //   } catch (error) {
  //     print(error);
  //   }

  //   return result;
  // }

  // Future<KulkulResultByKabupaten> getByKabupaten() async {
  //   KulkulResultByKabupaten result;

  //   try {
  //     Response api = await _api.get(
  //         '${ConfigHelper.url}/v1/kulkul',
  //         headers: {'Content-type': 'application/json'});

  //     result = KulkulResultByKabupaten.fromMap(json.decode(api.body));
  //   } catch (error) {
  //     print(error);
  //   }

  //   return result;
  // }
}
