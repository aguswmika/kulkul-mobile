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
      Response api = await _api.get(
          Uri.parse('${ConfigHelper.url}/v1/location'),
          headers: {'Content-type': 'application/json'});

      var result = json.decode(api.body);

      this.status = result['status'];
      this.message = result['message'];

      if (this.status == 'success') {
        data = <Location>[];

        if (result['data'] != null) {
          result['data'].forEach((item) {
            data.add(Location.fromMap(item));
          });
        }
      }
    } catch (error) {
      this.status = 'fail';
      this.message = 'Something went wrong';

      print(error);
    }

    return data;
  }

  Future<List<Desa>> getAllDesa(String id) async {
    this.reset();
    List<Desa> data;

    try {
      Response api = await _api.get(
          Uri.parse('${ConfigHelper.url}/v1/location/$id/desa'),
          headers: {'Content-type': 'application/json'});

      var result = json.decode(api.body);

      this.status = result['status'];
      this.message = result['message'];

      if (result['status'] == 'success') {
        data = <Desa>[];

        if (result['data'] != null) {
          result['data'].forEach((item) {
            data.add(Desa.fromMap(item));
          });
        }
      }
    } catch (error) {
      this.status = 'fail';
      this.message = 'Something went wrong';

      print(error);
    }

    return data;
  }

  Future<Map<String, dynamic>> getAllById(String type, String id) async {
    this.reset();
    Map<String, dynamic> data;

    try {
      Response api = await _api.get(
          Uri.parse('${ConfigHelper.url}/v1/location/$type/$id'),
          headers: {'Content-type': 'application/json'});

      var result = json.decode(api.body);

      this.status = result['status'];
      this.message = result['message'];

      if (result['status'] == 'success') {
        if(result['data'].isNotEmpty){
          data = result['data'];
        }
      }
    } catch (error) {
      this.status = 'fail';
      this.message = 'Something went wrong';

      print(error);
    }

    return data;
  }

  Future<List<Location>> getAllPura() async {
    this.reset();
    List<Location> data;

    try {
      Response api = await _api.get(
          Uri.parse('${ConfigHelper.url}/v1/location/pura'),
          headers: {'Content-type': 'application/json'});

      var result = json.decode(api.body);

      this.status = result['status'];
      this.message = result['message'];

      if (this.status == 'success') {
        data = <Location>[];

        if (result['data'] != null) {
          result['data'].forEach((item) {
            data.add(Location.fromMap(item));
          });
        }
      }
    } catch (error) {
      this.status = 'fail';
      this.message = 'Something went wrong';

      print(error);
    }

    return data;
  }

  Future<List<Desa>> getAllPuraDesa(String id) async {
    this.reset();
    List<Desa> data;

    try {
      Response api = await _api.get(
          Uri.parse('${ConfigHelper.url}/v1/location/pura/$id/desa'),
          headers: {'Content-type': 'application/json'});

      var result = json.decode(api.body);

      this.status = result['status'];
      this.message = result['message'];

      if (result['status'] == 'success') {
        data = <Desa>[];

        if (result['data'] != null) {
          result['data'].forEach((item) {
            data.add(Desa.fromMap(item));
          });
        }
      }
    } catch (error) {
      this.status = 'fail';
      this.message = 'Something went wrong';

      print(error);
    }

    return data;
  }
}
