import 'package:dio/dio.dart';
import 'package:semantic_kulkul/helpers/config_helper.dart';
import 'package:semantic_kulkul/services/storage_service.dart';
import 'package:get/get.dart';

class ApiHelper {
  final Dio _api = Dio();

  ApiHelper() {
    _api.options.baseUrl = ConfigHelper.url;
    _api.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Get.find<StorageService>().getToken()}' ?? null
    };
    _api.interceptors.add(InterceptorsWrapper(onError: (DioError e, handler) {
      if (e.response.statusCode == 401) {
        Get.find<StorageService>().removeToken();
        return handler.next(e);
      }
      return handler.next(e);
    }));
  }

  static Dio getInstance() {
    ApiHelper api = ApiHelper();
    return api._api;
  }
}
