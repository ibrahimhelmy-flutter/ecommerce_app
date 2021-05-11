import 'package:ecommerce_app/constanse.dart';
import 'package:ecommerce_app/core/view_model/cart_view_model.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CartViewModel>(
              init: Get.find(),
              builder: (controller) {
                return Scaffold(
      body:  controller.cartProducts.length == 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/image/undraw_empty_cart_co35.svg",
                          width: 200,
                          height: 200,
                        ),
                        SizedBox(height: 10),
                        CustomText(
                          text: " Cart Empty",
                          alignment: Alignment.center,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ],
                    )
                  : Column(
        children: [
          Expanded(
            child: ListView.separated(
                        itemBuilder: (context, index) {
                          CartProductModel product =
                              controller.cartProducts[index];
                          return Container(
                            height: 140,
                            padding: EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 15),
                            child: Row(
                              children: [
                                Container(
                                    width: 140,
                                    child: Image.network(product.image)),
                                SizedBox(width: 20.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomText(
                                      text: product.name,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    CustomText(
                                      text: "\$ ${product.price}",
                                      color: primaryColor,
                                    ),
                                    Container(
                                      color: Colors.grey.shade200,
                                      height: 40,
                                      child: Row(
                                        children: [
                                          IconButton(
                                              icon: Icon(Icons.add),
                                              onPressed: () {
                                                controller
                                                    .increaseQuntity(product);
                                              }),
                                          Text(product.quentity.toString()),
                                          IconButton(
                                              icon: Icon(Icons.remove),
                                              onPressed: () {
                                                controller
                                                    .decreseQuntity(product);
                                              }),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (_, index) {
                          return SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: controller.cartProducts.length)
            
         
          ),
          GetBuilder<CartViewModel>(
            init: Get.find(),
            builder: (controller) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: "total".toUpperCase(),
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: "\$ ${controller.totalprice} ",
                        color: primaryColor,
                      ),
                    ],
                  ),
                  Container(
                    height: 60,
                    width: 180,
                    child: CustomElevatedButton(
                      text: "CHECKOUT",
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  });
}
}