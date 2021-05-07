import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:ecommerce_app/view/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: () {
            Get.to(()=>LoginScreen());
          },
        ),
      ),
      body: ListView(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Sign up",
                    fontSize: 30,
                  ),
                  SizedBox(height: 30.0),
                  Form(
                      key: _globalKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            label: "Name",
                            textInputType: TextInputType.text,
                            onSaved: (val) {
                              controller.name = val;
                            },
                            validator: (val) {},
                          ),
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
                          CustomElevatedButton(
                            text: "Sign Up",
                            onPressed: () {
                              if (_globalKey.currentState.validate()) {
                                _globalKey.currentState.save();
                                controller.createUserEmailPassword();
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
        ],
      ),
    );
  }
}
