import 'package:an_e_commerce_store/controllers/popular_product_controller.dart';
import 'package:an_e_commerce_store/controllers/reommended_product_controller.dart';
import 'package:an_e_commerce_store/models/product_model.dart';
import 'package:an_e_commerce_store/pages/Food/PopularFoodDetail.dart';
import 'package:an_e_commerce_store/routes/route_helper.dart';
import 'package:an_e_commerce_store/widgets/appColumn.dart';
import 'package:an_e_commerce_store/widgets/smallText.dart';
import 'package:an_e_commerce_store/utilities/colors.dart';
import 'package:an_e_commerce_store/widgets/IconText_widget.dart';
import 'package:an_e_commerce_store/widgets/bigText.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utilities/application_constants.dart';
import '../../utilities/dimensions.dart';


class FoodDisplayBody extends StatefulWidget {
  const FoodDisplayBody({Key? key}) : super(key: key);

  @override
  State<FoodDisplayBody> createState() => _FoodDisplayBodyState();
}

class _FoodDisplayBodyState extends State<FoodDisplayBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  double _currentPageValue = 0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        // print('Current page value is  $_currentPageValue');
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ///slider
      GetBuilder<PopularProductController>(builder:(popularProducts){
        return popularProducts.isLoaded? Container(
          // color: Colors.red,
          height: Dimensions.height320,
          child: PageView.builder(
              controller: pageController,
              itemCount: popularProducts.popularProductList.length,
              itemBuilder: (context, position) {
                return _buildPageItem(position, popularProducts.popularProductList[position]);
              }),
        ): const Center(
          child: CircularProgressIndicator(
            color: AppColors.mainColor,
          ),
        );}
      ),
      ///dots
      GetBuilder<PopularProductController>(builder:(popularProducts){
        return DotsIndicator(
          dotsCount: popularProducts.popularProductList.isEmpty? 1: popularProducts.popularProductList.length,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius5),
            ),
          ),
        );
      }),
      SizedBox(
        height: Dimensions.height30,
      ),
      ///recommended food pairing text
      Container(
        margin: EdgeInsets.only(left: Dimensions.width30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const BigText(text: "Recommended"),
            SizedBox(
              width: Dimensions.width10,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 3),
              child: const BigText(
                text: '.',
                color: Colors.black26,
              ),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: const SmallText(
                text: 'Food Pairing',
              ),
            )
          ],
        ),
      ),
      ///List of recommended food
      GetBuilder<RecommendedProductController>(builder:(recommendedProducts){
        return recommendedProducts.isLoaded?ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recommendedProducts.recommendedProductList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getRecommendedFood(index, 'home'));
                },
                child: Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width15,
                    right: Dimensions.width9,
                    bottom: Dimensions.height10,
                  ),
                  child: Row(
                    children: [
                      ///image container
                      Container(
                        width: Dimensions.listviewImageSize,
                        height: Dimensions.listviewImageSize,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white38,
                          image:  DecorationImage(
                              fit: BoxFit.cover,
                            image: NetworkImage(
                                 AppConstants.BASE_URL+AppConstants.UPLOAD_URL+recommendedProducts.recommendedProductList[index].img!
                            ),
                          ),
                        ),
                      ),

                      ///text container
                      Expanded(
                        child: Container(
                          height: Dimensions.listviewTextContainerSize,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius20),
                                bottomRight: Radius.circular(Dimensions.radius20),
                              ),
                              color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center ,
                              children: [
                                BigText(text: recommendedProducts.recommendedProductList[index].name!/*'Fresh juice'*/),
                                SizedBox(height: Dimensions.height10,),
                                SmallText(text: 'Non-organic all natural'),
                                SizedBox(height: Dimensions.height10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const IconTextWidget(
                                        icon: Icons.circle,
                                        text: 'Normal',
                                        iconColor: AppColors.iconColor1),
                                    SizedBox(
                                      width: Dimensions.width10,
                                    ),
                                    const IconTextWidget(
                                        icon: Icons.location_on,
                                        text: '1.7km',
                                        iconColor: AppColors.mainColor),
                                    SizedBox(
                                      width: Dimensions.width10,
                                    ),
                                    const IconTextWidget(
                                        icon: Icons.watch_later_outlined,
                                        text: '32min',
                                        iconColor: AppColors.iconColor1),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }): CircularProgressIndicator(
          color: AppColors.mainColor,
        );
      })
    ]);
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      /// the current slide
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTransform = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      /// the next slide
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTransform = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      /// the previous slide
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTransform = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(children: [
        GestureDetector(
          onTap: (){
            Get.toNamed(RouteHelper.getPopularFood(index,'home' ));
          },
          child: Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image:  DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  AppConstants.BASE_URL+AppConstants.UPLOAD_URL+popularProduct.img!
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.height30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 5.0,
                  offset: Offset(0, 5),
                ),
                BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(5, 0),
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  left: Dimensions.width15,
                  right: Dimensions.width15),
              child: AppColumn(text: popularProduct.name!,),
            ),
          ),
        ),
      ]),
    );
  }
}
