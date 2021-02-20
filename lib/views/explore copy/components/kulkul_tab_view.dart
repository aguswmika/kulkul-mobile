// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:get/get.dart';
// import 'package:responsive_flutter/responsive_flutter.dart';
// import 'package:semantic_kulkul/controllers/explore_controller.dart';
// import 'package:semantic_kulkul/views/components/loading.dart';
// import 'package:semantic_kulkul/views/explore/components/kulkul_component.dart';
// import 'package:semantic_kulkul/views/explore/components/kulkul_kabupaten.dart';

// class KulkulTabView extends GetView<ExploreController> {
//   final TabController tabController;

//   KulkulTabView({Key key, this.tabController}) : super(key: key);

//   Future<void> onRefresh(String key) async {
//     await controller.fetchByLocation(key);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => TabBarView(
//           physics: NeverScrollableScrollPhysics(),
//           controller: this.tabController,
//           children: [
//             !controller.loading ? tabKulkul(context, 'desa') : Loading(),
//             !controller.loading ? tabKulkul(context, 'banjar') : Loading(),
//             !controller.loading ? tabKulkul(context, 'puraDesa') : Loading(),
//             !controller.loading ? tabKulkul(context, 'puraPuseh') : Loading(),
//             !controller.loading ? tabKulkul(context, 'puraDalem') : Loading(),
//             !controller.loading
//                 ? ListView(
//                     children: [
//                       KulkulKabupaten(
//                         title: 'Badung',
//                         data: controller.kulkulByKabupaten.badung,
//                       ),
//                       KulkulKabupaten(
//                         title: 'Bangli',
//                         data: controller.kulkulByKabupaten.bangli,
//                       ),
//                       KulkulKabupaten(
//                         title: 'Buleleng',
//                         data: controller.kulkulByKabupaten.buleleng,
//                       ),
//                       KulkulKabupaten(
//                         title: 'Gianyar',
//                         data: controller.kulkulByKabupaten.gianyar,
//                       ),
//                       KulkulKabupaten(
//                         title: 'Jembaran',
//                         data: controller.kulkulByKabupaten.jembrana,
//                       ),
//                       KulkulKabupaten(
//                         title: 'Karangasem',
//                         data: controller.kulkulByKabupaten.karangasem,
//                       ),
//                       KulkulKabupaten(
//                         title: 'Klungkung',
//                         data: controller.kulkulByKabupaten.klungkung,
//                       ),
//                       KulkulKabupaten(
//                         title: 'Tabanan',
//                         data: controller.kulkulByKabupaten.tabanan,
//                       ),
//                     ],
//                   )
//                 : Loading(),
//           ],
//         ));
//   }

//   RefreshIndicator tabKulkul(BuildContext context, String key) {
//     return RefreshIndicator(
//       onRefresh: () async {
//         await this.onRefresh(key);
//       },
//       child: GridView.count(
//           crossAxisCount: 2,
//           childAspectRatio: ResponsiveFlutter.of(context).scale(0.55),
//           padding: EdgeInsets.symmetric(
//               horizontal: ResponsiveFlutter.of(context).wp(2.5),
//               vertical: ResponsiveFlutter.of(context).wp(5)),
//           crossAxisSpacing: ResponsiveFlutter.of(context).wp(5),
//           mainAxisSpacing: ResponsiveFlutter.of(context).wp(5),
//           children:
//               List.generate(controller.getKulkulList(key).length, (index) {
//             return KulkulComponent(data: controller.getKulkulList(key)[index]);
//           })),
//     );
//   }
// }
