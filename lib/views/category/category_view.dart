
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semantic_kulkul/controllers/category_controller.dart';
import 'package:semantic_kulkul/controllers/home_controller.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/models/category_model.dart';
import 'package:semantic_kulkul/routes.dart';
import 'package:semantic_kulkul/views/components/loading_component.dart';

class CategoryView extends GetView<CategoryController> {
  Widget handleListRecursive(Category data, {String type}) {
    if (data.child == null) {
      return ListTile(
        title: Text(data.nama, style: TextStyle(color: Colors.blue),),
        onTap: () {
          if (data.id == 'Kabupaten') {
            Get.find<HomeController>().handleNavigation(0);
          } else if(data.id == 'Pura'){
            Get.toNamed(Routes.ExplorePuraView, parameters: {
              'title': 'Jelajahi Pura',
              'id': data.id
            });
          } else {
            Get.toNamed(Routes.KulkulView, parameters: {
              'title': '${type.split('_').join(' ').capitalize} - ${data.nama}',
              'type': type,
              'id': data.id
            });
          }
        },
      );
    }
    return ExpansionTile(
        title: Text(data.nama),
        children: List.generate(data.child.length,
            (index) => handleListRecursive(data.child[index], type: type)));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
                pinned: false,
                elevation: 0,
                centerTitle: false,
                title: Text('Kategori Kulkul',
                    style: TextStyle(color: ColorHelper.blackColor)),
                // flexibleSpace: FlexibleSpaceBar(title: Text('Jao'), background: ,),
                backgroundColor: Colors.transparent)
          ];
        },
        body: !controller.loading
            ? RefreshIndicator(
                onRefresh: () => controller.fetchCategories(),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int index) {
                    Category data = controller.categories[index];
                    return Theme(
                        data: Theme.of(context)
                            .copyWith(accentColor: ColorHelper.blueColor),
                        child: handleListRecursive(data, type: data.id));
                  },
                  itemCount: controller.categories.length,
                ),
              )
            : LoadingComponent(),
      ),
    );
  }
}
