import 'package:an_e_commerce_store/widgets/smallText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/colors.dart';
import '../utilities/dimensions.dart';
import 'IconText_widget.dart';
import 'bigText.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         BigText(text: text,size: Dimensions.font26),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                    (index) => const Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15,
                ),
              ),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            const SmallText(text: '4.5'),
            SizedBox(
              width: Dimensions.width10,
            ),
            const SmallText(
              text: '1287',
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            const SmallText(text: 'Comments')
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
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
        )
      ],
    );
  }
}
