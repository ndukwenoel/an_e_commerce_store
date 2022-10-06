import 'package:an_e_commerce_store/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final double lineSpacing;

  const SmallText(
      {Key? key,
        this.color = AppColors.textColor,
        required this.text,
        this.size = 12,
      this.lineSpacing =1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: 'RobotoMono',
        fontSize: size,
        height: lineSpacing
      ),
    );
  }
}
