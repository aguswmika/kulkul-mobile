import 'dart:convert';

import 'package:http/http.dart';
import 'package:semantic_kulkul/helpers/config_helper.dart';
import 'package:semantic_kulkul/models/location_model.dart';
import 'package:semantic_kulkul/repositories/repository.dart';

class LocationRepository extends Repository {
  final Client _api = Client();

  Future<List<Location>> getAll() async {
    this.reset();
    List<Location> data;

    try {
      Response api = await _api.get('${ConfigHelper.url}/v1/location',
          headers: {'Content-type': 'application/json'});

      var result = json.decode(api.body);
      if (result['status'] == 'success') {
        data = List<Location>();

        if (result['data'] != null) {
          result['data'].forEach((item) {
            data.add(Location.fromMap(item));
          });
        }
      } else {
        this.message = result['message'];
      }
    } catch (error) {
      print(error);
    }

    return data;
  }
}
