import 'package:ecommerce_app/constanse.dart';
import 'package:ecommerce_app/core/view_model/home_view_model.dart';
import 'package:ecommerce_app/view/cart_view.dart';
import 'package:ecommerce_app/view/profile_view.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          bestSellerBuilder(),
        ],
      )),
     
    );
  }



  Container categoryListBuilder() {
    return Container(
        height: 130,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
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
                        child: Image.asset("assets/image/Icon_MensShoe.png"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Men",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              );
            }));
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

  bestSellerBuilder() {
    return Container(
      height: 350,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (cotext, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/image/Image.png"),
                CustomText(
                  text: "Leather WirstWatch",
                  fontSize: 20,
                ),
                CustomText(
                  text: "Tage Huers",
                  color: Colors.grey,
                ),
                CustomText(
                  text: "\$ 450",
                  fontSize: 20,
                  color: primaryColor,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
