import 'package:dio/dio.dart';
import 'package:semantic_kulkul/models/populate_model.dart';
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
      Response response = await api.get('/v1/params/dimension');

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

  Future<List<SelectItem>> getAllDirection() async {
    List<SelectItem> data;
    try {
      Response response = await api.get('/v1/params/direction');

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

  Future<List<SelectItem>> getAllActivity() async {
    List<SelectItem> data;
    try {
      Response response = await api.get('/v1/params/activity');

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

  Future<void> storeKulkul(
      List<PopulateKulkul> dataKulkul, Map<String, dynamic> data) async {
    // _parseKulkulData(data[0]);
    try {
      Response response = await api.post('/v1/kulkul',
          data: FormData.fromMap({
            ...data,
            'kulkulDesa': await _parseKulkulData(dataKulkul[0]),
            'kulkulBanjar': await _parseKulkulData(dataKulkul[1]),
            'kulkulPuraDesa': await _parseKulkulData(dataKulkul[2]),
            'kulkulPuraPuseh': await _parseKulkulData(dataKulkul[3]),
            'kulkulPuraDalem': await _parseKulkulData(dataKulkul[4]),
          }));

      Map<String, dynamic> result = response.data;
      this.status = result['status'];
      this.message = result['message'];
    } catch (e) {
      print('error : $e');

      this.status = 'fail';
      this.message = 'Ada kesalahan';
    }
  }

  Future<Map<String, dynamic>> _parseKulkulData(PopulateKulkul data) async {
    Map<String, dynamic> mapData = {
      'number': data.number,
      'pengangge': data.pengangge.toMap(),
      'dimensions': data.dimensions.take(int.parse(data.number ?? 1)).map((e) => {'key': e}).toList(),
      'rawMaterials': data.rawMaterials
          .take(int.parse(data.number ?? 1))
          .map((e) => e.toMap())
          .toList(),
      'direction': data.direction,
      'images': <MultipartFile>[],
      'sounds': <Map<String, dynamic>>[]
    };

    if (data.images != null || data.images.isNotEmpty) {
      List<MultipartFile> images = <MultipartFile>[];
      await Future.forEach(data.images, (item) async {
        images.add(await MultipartFile.fromFile(item.path,
            filename: item.path.split('/').last));
      });
      mapData['images'] = images.map((e) => {'data': e}).toList();
    }

    if (data.sounds != null || data.sounds.isNotEmpty) {
      List<Map<String, dynamic>> sounds = <Map<String, dynamic>>[];

      await Future.forEach(data.sounds, (Sound item) async {
        Map<String, dynamic> sound = {
          'name': item.name.text,
          'lang': item.lang,
          'type': item.type,
          'activities': item.activities.map((e) => e.toMap()).toList(),
          'file': <MultipartFile>[]
        };

        if (item.file != null || item.file.isNotEmpty) {
          List<MultipartFile> file = <MultipartFile>[];

          await Future.forEach(item.file, (itemChild) async {
            file.add(await MultipartFile.fromFile(itemChild.path,
                filename: itemChild.path.split('/').last));
          });
          sound['file'] = file.map((e) => {'data': e}).toList();
        }
        sounds.add(sound);
      });
      mapData['sounds'] = sounds;
    }

    print(mapData);

    return mapData;
  }
}
