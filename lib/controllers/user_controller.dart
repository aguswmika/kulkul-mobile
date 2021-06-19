import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:semantic_kulkul/helpers/api_helper.dart';
import 'package:semantic_kulkul/helpers/snackbar_helper.dart';
import 'package:semantic_kulkul/models/user_model.dart';
import 'package:semantic_kulkul/repositories/user_repository.dart';

class UserController extends GetxController {
  Rx<User> user = User().obs;
  final formKey = GlobalKey<FormState>();
  final UserRepository _userRepository =
      UserRepository(ApiHelper.getInstance());

  Future<void> fetchUser() async {
    User result = await _userRepository.getUser();

    if (_userRepository.status == 'success') {
      user.value = result;
      print(user.value);
    } else {
      // SnackbarHelper.error(
      //     'Kesalahan',
      //     _userRepository.message,
      //   );
    }
  }

  Future<void> handleLogin() async {
    if (formKey.currentState.validate()) {
      EasyLoading.show(status: 'Loading...');

      await _userRepository.login(user.value);

      EasyLoading.dismiss();

      if (_userRepository.status == 'success') {
        await this.fetchUser();
        Get.back();
        SnackbarHelper.success('Berhasil', 'Anda berhasil login');
      } else {
        SnackbarHelper.error(
          'Kesalahan',
          _userRepository.message,
        );
      }
    }
  }
}
