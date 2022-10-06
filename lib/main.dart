import 'package:an_e_commerce_store/controllers/popular_product_controller.dart';
import 'package:an_e_commerce_store/pages/Food/PopularFoodDetail.dart';
import 'package:an_e_commerce_store/pages/Food/recomended_food_deatail.dart';
import 'package:an_e_commerce_store/pages/home/food_display_body.dart';
import 'package:an_e_commerce_store/pages/home/main_food_page.dart';
import 'package:an_e_commerce_store/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';
import 'package:an_e_commerce_store/resources/dependencies.dart' as dep;

import 'controllers/reommended_product_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return   GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: const MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
