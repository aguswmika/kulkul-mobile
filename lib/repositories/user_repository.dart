import 'package:dio/dio.dart';
import 'package:semantic_kulkul/models/user_model.dart';
import 'package:semantic_kulkul/repositories/repository.dart';
import 'package:get/get.dart' as state;
import 'package:semantic_kulkul/services/storage_service.dart';

class UserRepository extends Repository {
  final Dio api;
  UserRepository(this.api);

  Future<void> login(User user) async {
    try {
      Response response = await api.post('/v1/login',
          data: {'username': user.username, 'password': user.password});

      Map<String, dynamic> result = response.data;

      this.status = result['status'];

      if (this.status == 'success') {
        await state.Get.find<StorageService>().setToken(result['data']);
      } else {
        this.message = result['message'];
      }
    } catch (e) {
      print('error : $e');

      this.status = 'fail';
      this.message = 'Ada kesalahan';
    }
  }

  Future<User> getUser() async {
    User data;
    try {
      print(state.Get.find<StorageService>().getToken());
      Response response = await api.get('/v1/me');

      Map<String, dynamic> result = response.data;
      this.status = result['status'];

      if (this.status == 'success') {
        data = User.fromMap(result['data']);
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
