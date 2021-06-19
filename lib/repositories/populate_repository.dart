import 'package:dio/dio.dart';
import 'package:semantic_kulkul/repositories/repository.dart';
import 'package:semantic_kulkul/views/components/select_form_component.dart';

class PopulateRepository extends Repository {
  final Dio api;
  PopulateRepository(this.api);

  Future<List<SelectItem>> getAllKabupaten() async {
    List<SelectItem> data;
    try {
      Response response = await api.get('/v1/params/kabupaten');

      Map<String, dynamic> result = response.data;
      this.status = result['status'];

      if (this.status == 'success') {
        data = <SelectItem>[];
        if (result['data'] != null) {
          result['data'].forEach((item) {
            data.add(SelectItem.fromMap(item));
          });

        }
      } else {
        this.message = result['message'];
      }
    } catch (e) {
      print('error : $e');

      this.status = 'fail';
      this.message = 'Ada kesalahan';
    }

    return data;
  }

  Future<List<SelectItem>> getAllKecamatan(String id) async {
    List<SelectItem> data;
    try {
      Response response = await api.get('/v1/params/kabupaten/$id/kecamatan');

      Map<String, dynamic> result = response.data;
      this.status = result['status'];

      if (this.status == 'success') {
        data = <SelectItem>[];
        if (result['data'] != null) {
          result['data'].forEach((item) {
            data.add(SelectItem.fromMap(item));
          });

        }
      } else {
        this.message = result['message'];
      }
    } catch (e) {
      print('error : $e');

      this.status = 'fail';
      this.message = 'Ada kesalahan';
    }

    return data;
  }

  Future<List<SelectItem>> getAllDimension() async {
    List<SelectItem> data;
    try {
      Response response = await api.get('/v1/params/ukuran');

      Map<String, dynamic> result = response.data;
      this.status = result['status'];

      if (this.status == 'success') {
        data = <SelectItem>[];
        if (result['data'] != null) {
          result['data'].forEach((item) {
            data.add(SelectItem.fromMap(item));
          });

        }
      } else {
        this.message = result['message'];
      }
    } catch (e) {
      print('error : $e');

      this.status = 'fail';
      this.message = 'Ada kesalahan';
    }

    return data;
  }
}
