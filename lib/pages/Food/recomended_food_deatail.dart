import 'package:an_e_commerce_store/controllers/cart_controller.dart';
import 'package:an_e_commerce_store/controllers/popular_product_controller.dart';
import 'package:an_e_commerce_store/controllers/reommended_product_controller.dart';
import 'package:an_e_commerce_store/pages/cart/cart_page.dart';
import 'package:an_e_commerce_store/routes/route_helper.dart';
import 'package:an_e_commerce_store/utilities/application_constants.dart';
import 'package:an_e_commerce_store/utilities/colors.dart';
import 'package:an_e_commerce_store/utilities/dimensions.dart';
import 'package:an_e_commerce_store/widgets/app_icons.dart';
import 'package:an_e_commerce_store/widgets/bigText.dart';
import 'package:an_e_commerce_store/widgets/expandable_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:an_e_commerce_store/models/product_model.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
   const RecommendedFoodDetail({Key? key, required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: Dimensions.height80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    if(page=='cartpage'){
                      Get.toNamed(RouteHelper.getCartPage());
                    }else{
                      Get.toNamed(RouteHelper.getInitial());
                    }
                  },
                    child: AppIcon(icon: Icons.clear)),
                // AppIcon(icon: Icons.shopping_cart_outlined)
                GetBuilder<PopularProductController>(
                  builder: (controller) {
                    return GestureDetector(
                      onTap: (){
                        debugPrint('being tapped');
                        if(Get.find<PopularProductController>().totalItems >= 1) {
                          Get.toNamed(RouteHelper.getCartPage());
                        }
                      },
                      child: Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_outlined),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? Positioned(right:0,top:0,
                            child: AppIcon(
                              icon: Icons.circle,
                              size: Dimensions.height20,
                              iconColor: Colors.transparent,
                              backGroundColor: AppColors.mainColor,
                            ),
                          )
                              : Container(),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? Positioned(right:3,top:3,
                            child: BigText(text:Get.find<PopularProductController>().totalItems.toString(),
                                size: Dimensions.height15,
                                color: Colors.white),
                          )
                              : Container()
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height20),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                    top: Dimensions.height5, bottom: Dimensions.height10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20)),
                  color: Colors.white,
                ),
                child: Center(
                  child: BigText(
                    text: product.name!,
                    size: Dimensions.font26,
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: Dimensions.height300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width20, right: Dimensions.width20),
                    child: ExpandableTextWidget(
                        text:product.description!
                            //'Fresh juice made out of the finest of healthy fruits, professionally cut down with loving care towards the mother tree. Orange juice is not just about providing natural refreshing drinks but introducing healthy living into the lives of our customers to successfully make an impact against future health predicamments due to excessive intake of chemically formualarized consumption products. Fresh juice made out of the finest of healthy fruits, professionally cut down with loving care towards the mother tree. Orange juice is not just about providing natural refreshing drinks but introducing healthy living into the lives of our customers to successfully make an impact against future health predicamments due to excessive intake of chemically formualarized consumption products. Fresh juice made out of the finest of healthy fruits, professionally cut down with loving care towards the mother tree. Orange juice is not just about providing natural refreshing drinks but introducing healthy living into the lives of our customers to successfully make an impact against future health predicamments due to excessive intake of chemically formualarized consumption products. Fresh juice made out of the finest of healthy fruits, professionally cut down with loving care towards the mother tree. Orange juice is not just about providing natural refreshing drinks but introducing healthy living into the lives of our customers to successfully make an impact against future health predicamments due to excessive intake of chemically formualarized consumption products '
                            //'Fresh juice made out of the finest of healthy fruits, professionally cut down with loving care towards the mother tree. Orange juice is not just about providing natural refreshing drinks but introducing healthy living into the lives of our customers to successfully make an impact against future health predicamments due to excessive intake of chemically formualarized consumption products. Fresh juice made out of the finest of healthy fruits, professionally cut down with loving care towards the mother tree. Orange juice is not just about providing natural refreshing drinks but introducing healthy living into the lives of our customers to successfully make an impact against future health predicamments due to excessive intake of chemically formualarized consumption products. Fresh juice made out of the finest of healthy fruits, professionally cut down with loving care towards the mother tree. Orange juice is not just about providing natural refreshing drinks but introducing healthy living into the lives of our customers to successfully make an impact against future health predicamments due to excessive intake of chemically formualarized consumption products '
                    )),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20*2.5,
                right: Dimensions.width20*2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      controller.setQuantity(false);
                    },
                    child: AppIcon(
                      icon: Icons.remove,
                      iconColor: Colors.white,
                      iconSize: Dimensions.iconSize24,
                      backGroundColor: AppColors.mainColor,
                    ),
                  ),
                  BigText(text: ' \$${product.price!}   X   ${controller.inCartItems} ', color: AppColors.mainBlackColor,size: Dimensions.font26,),
                  GestureDetector(
                    onTap: (){
                      controller.setQuantity(true);
                    },
                    child: AppIcon(
                      icon: Icons.add,
                      iconColor: Colors.white,
                      iconSize: Dimensions.iconSize24,
                      backGroundColor: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: Dimensions.height120,
              padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20,right: Dimensions.width20),
              decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20*2),
                    topRight: Radius.circular(Dimensions.radius20*2)
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white,
                    ),
                    child: Icon(Icons.favorite, color: AppColors.mainColor,size: Dimensions.iconSize16),
                  ),
                  GestureDetector(
                    onTap: (){
                      controller.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor,
                      ),
                      child: BigText(text: '\$${product.price!}    Add to cart', color: Colors.white,),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },)
    );
  }
}
