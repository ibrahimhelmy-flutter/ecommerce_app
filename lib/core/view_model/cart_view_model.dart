import 'package:ecommerce_app/core/services/database.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  var dbHelper = CartDatebasehelper.db;
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProducts = [];
  List<CartProductModel> get cartProducts => _cartProducts;

  double _totalPrice = 0.0;
  double get totalprice => _totalPrice;

  CartViewModel() {
    getAllProduct();

    print("${_cartProducts.length}");
  }

  getAllProduct() async {
    _loading.value = true;

    _cartProducts = await dbHelper.getAllProduct();
    print("${_cartProducts.length}");
    _loading.value = false;
    getTotallPrice(); //after get allproduct calculate price
    update();
  }

  getTotallPrice() {
    for (int i = 0; i < _cartProducts.length; i++) {
      _totalPrice +=
          double.tryParse(_cartProducts[i].price) * _cartProducts[i].quentity;

      print("toooooo $_totalPrice");
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProducts.length; i++) {
      if (_cartProducts[i].productId == cartProductModel.productId) {
        return;
      }
    }

    await dbHelper.insert(cartProductModel);
    _cartProducts.add(cartProductModel);
    _totalPrice +=
        double.tryParse(cartProductModel.price) * cartProductModel.quentity;
    update();
  }

  increaseQuntity(CartProductModel cartProductMo) async {
    cartProductMo.quentity++;
    _totalPrice += double.tryParse(cartProductMo.price);
    await dbHelper.updateQuentity(cartProductMo);
    update();
  }

  decreseQuntity(CartProductModel cartProductMo) async {
    cartProductMo.quentity--;
    _totalPrice -= double.tryParse(cartProductMo.price);
     await dbHelper.updateQuentity(cartProductMo);

    update();
  }
}
