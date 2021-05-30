import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  SharedPreferences _prefs;

  Future<void> setToken(String token) async {
    await _prefs.setString('token', token);
  }

  String getToken() {
    return _prefs.getString('token');
  }

  void removeToken() {
    _prefs.remove('token');
  }

  // @override
  // void onInit() {
  //   init();

  //   super.onInit();
  // }

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();

    return this;
  }
}
