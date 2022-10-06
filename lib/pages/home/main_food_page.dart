import 'package:an_e_commerce_store/widgets/smallText.dart';
import 'package:an_e_commerce_store/utilities/colors.dart';
import 'package:an_e_commerce_store/widgets/bigText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'food_display_body.dart';
import 'header.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Header(),
          Expanded(
            child: SingleChildScrollView(
              child: FoodDisplayBody(),
            ),
          ),
        ],
      ),
    );
  }
}
