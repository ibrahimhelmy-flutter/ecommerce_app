import 'package:ecommerce_app/core/services/home_services.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:flutter/cupertino.dart';

import '../../model/category_model.dart';

import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> _isLoading = ValueNotifier(false);
  ValueNotifier<bool> get isLoading => _isLoading;
  List<CategoryModel> _categorymodels = [];
  List<CategoryModel> get categoris => _categorymodels;

  List<ProductModel> _products = [];
  List<ProductModel> get products => _products; 

//in this constactor we should call  all methods
  HomeViewModel() {
    getCategory();
    getBestSelling();
  }

  void getCategory() async {
    _isLoading.value = true;
    await HomeServices().getCategory().then((docs) {
      for (var item in docs) {
        categoris.add(CategoryModel.fromjson(item.data()));
      }
      _isLoading.value = false;
      update();
    });
  }

  void getBestSelling() async {
    _isLoading.value = true;

    await HomeServices().getProduct().then((docs) {
      for (var item in docs) {
        _products.add(ProductModel.fromJson(item.data()));
      }
      _isLoading.value = false;
      update();
    });
  }
}
