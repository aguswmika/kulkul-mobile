import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  SharedPreferences prefs;

  Future<void> setToken(String token) async {
    await prefs.setString('token', token);
  }

  String getToken() {
    return prefs.getString('token');
  }

  void removeToken() {
    prefs.remove('token');
  }

  // @override
  // void onInit() {
  //   init();

  //   super.onInit();
  // }

  Future<StorageService> init() async {
    prefs = await SharedPreferences.getInstance();

    return this;
  }
}
