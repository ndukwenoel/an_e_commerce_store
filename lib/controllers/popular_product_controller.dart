import 'package:an_e_commerce_store/controllers/cart_controller.dart';
import 'package:an_e_commerce_store/data/repository/popular_rpoduct-repo.dart';
import 'package:an_e_commerce_store/models/product_model.dart';
import 'package:an_e_commerce_store/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print('established conatct');
      _popularProductList = [];
      _popularProductList.addAll(Product
          .fromJson(response.body)
          .products);
      _isLoaded = true;
      update();
    } else {

    }
  }

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;

  int get inCartItems => _inCartItems + _quantity;

  void setQuantity(bool isIncrement) {
    /// this method in general would be responsible for increasing
    /// or decreasing items based on a button click/tap in our cart
    /// +(increase) is true and -(decrease) is false
    if (isIncrement) {
      debugPrint('increased cart');
      _quantity = checkQuantity(_quantity + 1);
    } else {
      debugPrint('decreased cart');
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
    //update is a function in the GetX package
    // that redraws the ui like a setState function
  }

  int checkQuantity(int quantity) {
    /// this function checks the quantity so the order
    /// doesn't go below 0 to negative numbers
    /// and doesn't exceed 20 as maximum buy at a go
    if ((_inCartItems+quantity) < 0) {
      Get.snackbar('Item count', 'Cart is empty now!',
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white);
      if (_inCartItems>0){
        _quantity = - _inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems+quantity) > 20) {
      Get.snackbar('Item Count', 'Cart if full!');
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    if(exist){
      _inCartItems = _cart.getQuantity(product);
    }
    // update();
    /// we would have a storage system
    /// get from the storage and store it in the cartItem
    /// when we click the add to cart button
  }

  void addItem(ProductModel product) {

      _cart.addItem(product, _quantity);
      _quantity =0;
      _inCartItems = _cart.getQuantity(product);
      _cart.items.forEach((key, value) {
        print('Id is ${value.id.toString()} quantity is ${value.quantity.toString()}');
      });
      update();
  }

  int get totalItems{
    return _cart.totalItems;
  }

  List<CartModel> get getItems{
    return _cart.getItems;
  }
}