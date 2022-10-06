import 'package:an_e_commerce_store/utilities/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/colors.dart';
import '../../widgets/bigText.dart';
import '../../widgets/smallText.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
      padding:  EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children:   [
              const BigText(text: 'Nigeria', color: AppColors.mainColor, ),
              Row(
                children: const [
                  SmallText(text: 'Lagos', color: Colors.black45,),
                  Icon(Icons.arrow_drop_down_rounded)
                ],
              )
            ],
          ),
          Container(
            width: Dimensions.width45,
            height: Dimensions.height45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius15),
              color: AppColors.mainColor,
            ),
            child:  Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24,),
          )
        ],
      ),
    );
  }
}