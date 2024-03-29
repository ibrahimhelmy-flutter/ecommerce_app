import 'package:ecommerce_app/constanse.dart';
import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/register_view.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_button_social.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:ecommerce_app/view/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
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
                      GestureDetector(
                        onTap: () {
                          Get.to(()=>RegisterView());
                        },
                        child: CustomText(
                          text: "Sign up",
                          color: primaryColor,
                          fontSize: 18,
                        ),
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
                            onSaved: (val) {
                              controller.email = val;
                            },
                            validator: (val) => !val.contains("@")
                                ? "To Email is Bad Formatt"
                                : null,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          CustomTextFormField(
                            label: "password",
                            obscureText: true,
                            onSaved: (val) {
                              controller.password = val;
                            },
                            validator: (val) {
                              if (val.toString().isEmpty) {
                                return "Empty password";
                              } else if (val.toString().length < 4) {
                                return "password less than 4 char";
                              }
                            },
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
                              if (_globalKey.currentState.validate()) {
                                _globalKey.currentState.save();
                                controller.signInByEmailPassword();
                              }
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
            onPreseed: () async {
              controller.faceboksignInMethod();
            },
            text: "Sign in With faceBook",
          ),
          SizedBox(height: 20.0),
          CustomButtonSocial(
            imagename: "assets/image/google.png",
            onPreseed: () {
              controller.googleSignInMethod();
            },
            text: "Sign in With Google",
          ),
        ],
      ),
    );
  }
}
