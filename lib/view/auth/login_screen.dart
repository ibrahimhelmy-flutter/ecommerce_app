import 'package:ecommerce_app/constanse.dart';
import 'package:ecommerce_app/view/auth/second_page.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_button_social.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:ecommerce_app/view/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Wellcom,",
                        fontSize: 30,
                      ),
                      CustomText(
                        text: "Sign up",
                        color: primaryColor,
                        fontSize: 18,
                      )
                    ],
                  ),
                  CustomText(
                    text: "sign in to continue",
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 30.0),
                  Form(
                      key: _globalKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            label: "Email",
                            textInputType: TextInputType.emailAddress,
                            onSaved: (val) {},
                            validator: (val) {},
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          CustomTextFormField(
                            label: "password",
                            obscureText: true,
                            onSaved: (val) {},
                            validator: (val) {},
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          CustomText(
                            text: "forget Password?",
                            alignment: Alignment.bottomRight,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          CustomElevatedButton(
                            text: "Sign In",
                            onPressed: () {
                              Get.to(Secondpage());
                            },
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          CustomText(
            text: "-OR-",
            alignment: Alignment.center,
            fontSize: 20,
          ),
          SizedBox(height: 40.0),
          CustomButtonSocial(
            imagename: "assets/image/facebook.png",
            onPreseed: () {},
            text: "Sign in With faceBook",
          ),
          SizedBox(height: 20.0),
          CustomButtonSocial(
            imagename: "assets/image/google.png",
            onPreseed: () {},
            text: "Sign in With Google",
          ),
        ],
      ),
    );
  }
}
