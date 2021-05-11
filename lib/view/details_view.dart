import 'package:ecommerce_app/constanse.dart';
import 'package:ecommerce_app/core/view_model/cart_view_model.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';

import 'package:ecommerce_app/model/product_model.dart';

import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailesView extends StatelessWidget {
  final ProductModel product;

  const ProductDetailesView({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              imageHeaderbuilder(context),
              CustomText(
                text: product.name,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  chipBuilder(context, "size", Text(product.size)),
                  chipBuilder(
                      context,
                      "Color",
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: product.color),
                      )),
                ],
              ),
              SizedBox(height: 20),
              CustomText(
                text: "Details",
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 20),
              CustomText(
                text: product.description,
                height: 2.5,
              )
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomText(
                      text: "PRICE",
                      color: Colors.grey,
                    ),
                    CustomText(
                      text: "\$1500 ",
                      color: primaryColor,
                    ),
                  ],
                ),
                GetBuilder<CartViewModel>(
                  init: CartViewModel(),
                  builder: (controller) => Container(
                    height: 60,
                    width: 180,
                    child: CustomElevatedButton(
                      onPressed: () {
                        controller.addProduct(CartProductModel(
                            name: product.name,
                            image: product.image,
                            price: product.price,
                            quentity: 1,
                            productId: product.productId
                            ));
                      },
                      text: "ADD",
                    ),
                  ),
                ),
                //  )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container chipBuilder(BuildContext context, String key, Widget value) {
    return Container(
      height: 46,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Text(key), value],
      ),
    );
  }

  Container imageHeaderbuilder(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 280,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            product.image,
            fit: BoxFit.cover,
          ),
          Positioned(
            child: Icon(Icons.arrow_back_ios),
            top: 60,
            left: 20,
          ),
          Positioned(
            child: Icon(Icons.star_border),
            top: 60,
            right: 20,
          )
        ],
      ),
    );
  }
}
