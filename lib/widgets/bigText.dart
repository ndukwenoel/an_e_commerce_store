import 'package:an_e_commerce_store/utilities/colors.dart';
import 'package:an_e_commerce_store/utilities/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextOverflow overflow;

  const BigText(
      {Key? key,
      this.color = AppColors.mainBlackColor,
      required this.text,
      this.overflow = TextOverflow.fade,
      this.size = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'RobotoMono',
        fontSize: size==0?Dimensions.font20:size,
      ),
    );
  }
}
