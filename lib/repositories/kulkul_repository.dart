import 'dart:convert';

import 'package:semantic_kulkul/helpers/config_helper.dart';
import 'package:http/http.dart';
import 'package:semantic_kulkul/models/kulkul_model.dart';

class KulkulRepository {
  final Client _api = Client();
  Future<KulkulResult> getAll({location}) async {
    KulkulResult result;
    String _location = 'desa';
    try {
      if (location != null) {
        _location = location;
      }
      Response api = await _api.get(
          '${ConfigHelper.url}/v1/kulkul-location/$_location',
          headers: {'Content-type': 'application/json'});

      result = KulkulResult.fromMap(json.decode(api.body));
    } catch (error) {
      print(error);
    }

    return result;
  }

  Future<KulkulResultByKabupaten> getByKabupaten() async {
    KulkulResultByKabupaten result;
    
    try {
      Response api = await _api.get(
          '${ConfigHelper.url}/v1/kulkul',
          headers: {'Content-type': 'application/json'});

      result = KulkulResultByKabupaten.fromMap(json.decode(api.body));
    } catch (error) {
      print(error);
    }

    return result;
  }
}
