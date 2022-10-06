import 'package:get/get.dart';

class Dimensions{
   static double screenHeight =  Get.context!.height;
   static double screenWidth =  Get.context!.width;


   /// first we need to get the screen height and then
   /// divide it by a factor X
   /// x = height factor ...... or x = width factor
   /// i'm debugging with an iphone 12 screen height is 844.0
   /// because i ran MediaQuery.(of context).size.height in a print function.
   /// therefore i'll divide my screen height by the height of each widget
   /// as it appears on the iphone 12 to get the percentage of the widgets height in ratio to screen height
   /// so i can use this percentage to get the right size for every screen size


   static double pageView = screenHeight/2.6;  // pageView height is 320 on iphone 12 pro
   static double pageViewContainer = screenHeight/3.84;  // pageViewContainer height is 220 on iphone 12pro
   static double pageViewTextContainer = screenHeight/7.03;  // pageViewTextContainer height is 120 on iphone 12pro

/// dynamically calculating padding and margin distances

   static double height5 = screenHeight/168.8;  //height of 10
   static double height10 = screenHeight/84.4;  //height of 10
   static double height15 = screenHeight/56.3;  //height of 15
   static double height20 = screenHeight/42.2;  //height of 20
   static double height25 = screenHeight/33.8;  //height of 25
   static double height30 = screenHeight/28.1;  //height of 30
   static double height40 = screenHeight/21.1;  //height of 40
   static double height45 = screenHeight/18.8;  //height of 45
   static double height50 = screenHeight/16.9;  //height of 50
   static double height80 = screenHeight/10.55;  //height of 80
   static double height120 = screenHeight/7.03;  //height of 120
   static double height300 = screenHeight/2.81;  //height of 300


   ///
   static double width8 = screenHeight/105.5;  //width of 8
   static double width9 = screenHeight/93.77;  //width of 9
   static double width10 = screenHeight/84.4;  //width of 10
   static double width15 = screenHeight/56.3;  //width of 15
   static double width20 = screenHeight/42.2;  //width of 20
   static double width25 = screenHeight/33.8;  //width of 25
   static double width30 = screenHeight/28.1;  //width of 30
   static double width40 = screenHeight/21.1;  //width of 40
   static double width45 = screenHeight/18.8;  //width of 45
   static double width50 = screenHeight/16.9;  //width of 50

/// fonts
   static double font16 = screenHeight/52.75;
   static double font20 = screenHeight/42.2;
   static double font26 = screenHeight/32.46;


   /// radius
   static double radius5 = screenHeight/168.8;
   static double radius15 = screenHeight/56.3;
   static double radius20 = screenHeight/42.2;
   static double radius30 = screenHeight/28.1;

   /// icon size
   /// 24 pixels is the default icon size
   /// so we divide 844 by 24
   static double iconSize24 = screenHeight/35.17;
   static double iconSize16 = screenHeight/52.75;


   ///List view size
   //screen width is 390
   static double listviewImageSize = screenWidth/3.25; //width of 120
   static double listviewTextContainerSize = screenWidth/3.9; //width of 100

 /// Popular Food
   static double popularFoodImageSize = screenHeight/2.41;  //height of 350
}