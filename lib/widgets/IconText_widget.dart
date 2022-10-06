import 'package:an_e_commerce_store/utilities/dimensions.dart';
import 'package:an_e_commerce_store/widgets/smallText.dart';
import 'package:flutter/cupertino.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
  final Color iconColor;

  const IconTextWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconColor, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.iconSize24,),
        SizedBox(width: 5,),
        SmallText(text: text, color: color,),
      ],
    );
  }
}
