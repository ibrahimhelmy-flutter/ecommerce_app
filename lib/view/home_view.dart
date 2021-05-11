import 'package:ecommerce_app/constanse.dart';
import 'package:ecommerce_app/core/view_model/home_view_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/details_view.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  // FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SafeArea(
                  child: ListView(
                children: [
                  searchTextFormField(),
                  CustomText(
                    text: "Categories",
                    fontSize: 30,
                  ),
                  categoryListBuilder(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Best Selling",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        text: "see all",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  bestSellerBuilder(context),
                ],
              )),
            ),
    );
  }

  Widget categoryListBuilder() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
          height: 130,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.categoris.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child:
                              Image.network(controller.categoris[index].image),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        controller.categoris[index].name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                );
              })),
    );
  }

  Container searchTextFormField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
          color: Color.fromRGBO(243, 242, 243, 1),
          borderRadius: BorderRadius.circular(20.0)),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 40,
            ),
            border: InputBorder.none),
      ),
    );
  }

  bestSellerBuilder(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => Container(
        height: 300,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.products.length,
          itemBuilder: (cotext, index) {
            ProductModel product = controller.products[index];
            return GestureDetector(
              onTap: () {
                Get.to(() => ProductDetailesView(
                      product: product,
                    ));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Image.network(
                        product.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    CustomText(
                      text: product.name,
                      fontSize: 20,
                    ),
                    CustomText(
                      text: product.description,
                      maxLine: 1,
                      color: Colors.grey,
                    ),
                    CustomText(
                      text: "\$ ${product.price}",
                      fontSize: 20,
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
