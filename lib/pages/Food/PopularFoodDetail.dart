import 'package:an_e_commerce_store/controllers/cart_controller.dart';
import 'package:an_e_commerce_store/controllers/popular_product_controller.dart';
import 'package:an_e_commerce_store/pages/cart/cart_page.dart';
import 'package:an_e_commerce_store/pages/home/main_food_page.dart';
import 'package:an_e_commerce_store/routes/route_helper.dart';
import 'package:an_e_commerce_store/utilities/application_constants.dart';
import 'package:an_e_commerce_store/utilities/dimensions.dart';
import 'package:an_e_commerce_store/widgets/app_icons.dart';
import 'package:an_e_commerce_store/widgets/expandable_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utilities/colors.dart';
import '../../widgets/IconText_widget.dart';
import '../../widgets/appColumn.dart';
import '../../widgets/bigText.dart';
import '../../widgets/smallText.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularFoodDetail({Key? key, required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ///background image
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImageSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        product.img!),
                  ),
                ),
              ),
            ),

            ///icon widget
            Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if(page=='cartpage'){
                          Get.toNamed(RouteHelper.getCartPage());
                        }else{
                          Get.toNamed(RouteHelper.getInitial());
                        }
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios)),
                  GetBuilder<PopularProductController>(
                    builder: (controller) {
                      return GestureDetector(
                        onTap: (){
                          if(Get.find<PopularProductController>().totalItems >= 1) {
                            Get.toNamed(RouteHelper.getCartPage());
                          }
                        },
                        child: Stack(
                          children: [
                            const AppIcon(icon: Icons.shopping_cart_outlined),
                            Get.find<PopularProductController>().totalItems >= 1
                                ?  Positioned(right:0,top:0,
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
                                  size: 12,
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
            ),

            ///food introduction
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: Dimensions.popularFoodImageSize,
                child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      top: Dimensions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          topLeft: Radius.circular(Dimensions.radius20)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text: product.name!),
                      SizedBox(
                        height: Dimensions.height40,
                      ),
                      BigText(text: 'Introduce'),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                              child: ExpandableTextWidget(
                        text: product.description!,
                        //'Fresh juice made out of the finest of healthy fruits, professionally cut down with loving care towards the mother tree. Orange juice is not just about providing natural refreshing drinks but introducing healthy living into the lives of our customers to successfully make an impact against future health predicamments due to excessive intake of chemically formualarized consumption products ',
                      ))),
                    ],
                  ),
                )),
          ],
        ),
        bottomNavigationBar:
            GetBuilder<PopularProductController>(builder: (popularProduct) {
          return Container(
            height: Dimensions.height120,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(false);
                          },
                          child: Icon(
                            Icons.remove,
                            color: AppColors.signColor,
                          )),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      BigText(text: popularProduct.inCartItems.toString()),
                      SizedBox(
                        width: Dimensions.width10 ,
                      ),
                      GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(true);
                          },
                          child: Icon(
                            Icons.add,
                            color: AppColors.signColor,
                          ))
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    popularProduct.addItem(product);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        left: Dimensions.width20,
                        right: Dimensions.width20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor,
                    ),
                    child: BigText(
                      text: '\$${product.price!}    Add to cart',
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        })
    );
  }
}

class FoodIntroduction extends StatelessWidget {
  int pageId;

  FoodIntroduction({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        top: Dimensions.popularFoodImageSize,
        child: Container(
          padding: EdgeInsets.only(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.height20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20)),
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppColumn(text: product.name!),
              SizedBox(
                height: Dimensions.height40,
              ),
              BigText(text: 'Introduce'),
              SizedBox(
                height: Dimensions.height20,
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                text: product.decription!,
                //'Fresh juice made out of the finest of healthy fruits, professionally cut down with loving care towards the mother tree. Orange juice is not just about providing natural refreshing drinks but introducing healthy living into the lives of our customers to successfully make an impact against future health predicamments due to excessive intake of chemically formualarized consumption products ',
              ))),
            ],
          ),
        ));
  }
}

class IconWidgets extends StatelessWidget {
  final String page;
  const IconWidgets({
    Key? key, required this.page
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Dimensions.height45,
      left: Dimensions.width20,
      right: Dimensions.width20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                if(page=='cartpage'){
                  Get.toNamed(RouteHelper.getCartPage());
                }else{
                  Get.to(RouteHelper.getInitial());
                }
              },
              child: AppIcon(icon: Icons.arrow_back_ios)),
          GetBuilder<PopularProductController>(
            builder: (controller) {
              return GestureDetector(
                onTap: (){
                  if(Get.find<PopularProductController>().totalItems >= 1)
                  Get.toNamed(RouteHelper.getCartPage());
                },
                child: Stack(
                  children: [
                    AppIcon(icon: Icons.shopping_cart_outlined),
                    Get.find<PopularProductController>().totalItems >= 1
                        ? Positioned(right:0,top:0,
                          child: AppIcon(
                              icon: Icons.circle,
                              size: 20,
                              iconColor: Colors.transparent,
                              backGroundColor: AppColors.mainColor,
                            ),
                        )
                        : Container(),
                    Get.find<PopularProductController>().totalItems >= 1
                        ? Positioned(right:3,top:3,
                      child: BigText(text:Get.find<PopularProductController>().totalItems.toString(),
                      size: 12,
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
    );
  }
}

class BackGroundImage extends StatelessWidget {
  int pageId;

  BackGroundImage({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    return Positioned(
      left: 0,
      right: 0,
      child: Container(
        width: double.maxFinite,
        height: Dimensions.popularFoodImageSize,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!),
          ),
        ),
      ),
    );
  }
}
