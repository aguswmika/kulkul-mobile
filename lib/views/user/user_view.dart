import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:semantic_kulkul/controllers/home_controller.dart';
import 'package:semantic_kulkul/controllers/user_controller.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/helpers/snackbar_helper.dart';
import 'package:semantic_kulkul/helpers/text_helper.dart';
import 'package:semantic_kulkul/routes.dart';
import 'package:semantic_kulkul/services/storage_service.dart';
import 'package:semantic_kulkul/views/components/separator_component.dart';

class UserView extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorHelper.whiteColor,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  pinned: false,
                  elevation: 0,
                  centerTitle: false,
                  title: Text('Pengguna',
                      style: TextStyle(color: ColorHelper.blackColor)),
                  backgroundColor: Colors.transparent)
            ];
          },
          body: Obx(() => Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                    left: ResponsiveFlutter.of(context).wp(3),
                    right: ResponsiveFlutter.of(context).wp(3),
                    top: ResponsiveFlutter.of(context).wp(3),
                    bottom: ResponsiveFlutter.of(context).wp(3)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Halo,',
                      style: TextStyle(
                          fontSize: Heading.h3, fontWeight: FontWeight.w600),
                    ),
                    SeparatorComponent(
                      height: 2.5,
                    ),
                    Text(
                      '${controller.user.value.name}',
                      style: TextStyle(
                          fontSize: Heading.h2, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.fade,
                    ),
                    SeparatorComponent(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.PopulateView);
                      },
                      child: Container(
                        width: double.infinity,
                        child: Text(
                          'Tambahkan Kulkul',
                          style: TextStyle(
                              fontSize: Heading.h2,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SeparatorComponent(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                        context: Get.context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Konfirmasi'),
                            content: Text('Apakah Anda yakin ingin keluar?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text('Tidak'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  Get.back();
                                  Get.find<StorageService>().removeToken();
                                  Get.find<HomeController>().handleNavigation(0);
                                  SnackbarHelper.info('Informasi',
                                      'Anda berhasil keluar',);
                                },
                                child: Text(
                                  'Ya',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                      },
                      child: Container(
                        width: double.infinity,
                        child: Text(
                          'Keluar',
                          style: TextStyle(
                              fontSize: Heading.h2,
                              color: ColorHelper.redColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
