// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:responsive_flutter/responsive_flutter.dart';
// import 'package:semantic_kulkul/helpers/color_helper.dart';
// import 'package:semantic_kulkul/views/explore/components/kulkul_tab_view.dart';

// class ExploreView extends StatefulWidget {
//   @override
//   _ExploreViewState createState() => _ExploreViewState();
// }

// class _ExploreViewState extends State<ExploreView>
//     with SingleTickerProviderStateMixin {
//   // final ExploreController exploreController = Get.put(ExploreController());
//   TabController tabController;

//   @override
//   void initState() {
//     tabController = TabController(length: 6, vsync: this);
//     super.initState();
//   }

//   // void handleTabChange(int index) async {
//   //   switch (index) {
//   //     case 0:
//   //       // loading();
//   //       await exploreController.fetchKulkul('desa');
//   //       // closeLoading();
//   //       break;
//   //     case 1:
//   //       // loading();
//   //       await exploreController.fetchKulkul('banjar');
//   //       // closeLoading();
//   //       break;
//   //     case 2:
//   //       // loading();
//   //       await exploreController.fetchKulkul('puraDesa');
//   //       // closeLoading();
//   //       break;
//   //     case 3:
//   //       // loading();
//   //       await exploreController.fetchKulkul('puraPuseh');
//   //       // closeLoading();
//   //       break;
//   //     case 4:
//   //       // loading();
//   //       await exploreController.fetchKulkul('puraDalem');
//   //       // closeLoading();
//   //       break;
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return NestedScrollView(
//           headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//             return [
//               SliverAppBar(
//                 pinned: false,
//                 elevation: 0,
//                 centerTitle: false,
//                 actions: [
//                   IconButton(
//                     icon: Icon(
//                       Icons.search,
//                       color: ColorHelper.blackColor,
//                     ),
//                     onPressed: () {},
//                     tooltip: 'Search',
//                   )
//                 ],
//                 title: Text('Jelajahi Kulkul',
//                     style: TextStyle(color: ColorHelper.blackColor)),
//                 // flexibleSpace: FlexibleSpaceBar(title: Text('Jao'), background: ,),
//                 backgroundColor: Colors.transparent,
//                 bottom: TabBar(
//                     controller: this.tabController,
//                     // onTap: this.handleTabChange,
//                     labelColor: ColorHelper.blueColor,
//                     indicatorWeight: ResponsiveFlutter.of(context).wp(1),
//                     indicatorColor: ColorHelper.blueColor,
//                     unselectedLabelColor: ColorHelper.grayColor,
//                     isScrollable: true,
//                     indicatorSize: TabBarIndicatorSize.label,
//                     tabs: [
//                       Tab(child: Text('Desa')),
//                       Tab(icon: Text('Banjar')),
//                       Tab(icon: Text('Pura Desa')),
//                       Tab(icon: Text('Pura Puseh')),
//                       Tab(icon: Text('Pura Dalem')),
//                       Tab(icon: Text('Kabupaten')),
//                     ]),
//               )
//             ];
//           },
//           body: KulkulTabView(
//             tabController: this.tabController,
//           ));
//   }
// }
