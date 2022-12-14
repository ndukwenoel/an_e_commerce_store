import 'package:an_e_commerce_store/pages/home/main_food_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    MainFoodPage(),
    Container(child: Center(child: Text('Next page')),),
    Container(child: Center(child: Text('Next next page')),),
    Container(child: Center(child: Text('Next next next  page')),),
  ];

  void onTapNav(int index){
    setState((){
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled ),
              label: 'Home'
          ), BottomNavigationBarItem(
              icon: Icon(Icons.archive ),
              label: 'History'
          ), BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart'
          ), BottomNavigationBarItem(
              icon: Icon(Icons.person ),
              label: 'Me'
          ),
        ],
      ),
    );
  }
}
