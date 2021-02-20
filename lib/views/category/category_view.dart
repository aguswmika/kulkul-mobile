import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semantic_kulkul/controllers/category_controller.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/models/category_model.dart';
import 'package:semantic_kulkul/views/components/loading.dart';

class CategoryView extends GetView<CategoryController> {
  Widget handleListRecursive(Category data) {
    if (data.child == null) {
      return ListTile(
        title: Text(data.nama),
      );
    }
    return ExpansionTile(
        title: Text(data.nama),
        children: List.generate(data.child.length,
            (index) => handleListRecursive(data.child[index])));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => NestedScrollView(
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
        body: !controller.loading ?  ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            Category data = controller.categories[index];
            return Theme(
              data: Theme.of(context).copyWith(accentColor: ColorHelper.blueColor),
              child: handleListRecursive(data)
              );
          },
          itemCount: controller.categories.length,
        ) : Loading(),
      ),
    );
  }
}
