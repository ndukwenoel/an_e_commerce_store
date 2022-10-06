import 'package:an_e_commerce_store/controllers/popular_product_controller.dart';
import 'package:an_e_commerce_store/data/repository/popular_rpoduct-repo.dart';
import 'package:an_e_commerce_store/utilities/application_constants.dart';
import 'package:get/get.dart';
import '../controllers/reommended_product_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init()async {
  /// for api client
  Get.lazyPut(()=> ApiClient( appBaseUrl: AppConstants.BASE_URL));

  /// for repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  /// for controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
}