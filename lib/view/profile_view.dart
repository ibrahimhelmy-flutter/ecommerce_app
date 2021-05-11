import 'dart:ui';

import 'package:ecommerce_app/constanse.dart';
import 'package:ecommerce_app/core/view_model/profile_view_model.dart';
import 'package:ecommerce_app/helper/local_storage_data.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';

import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  LocalStorageData localStorageData = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) {
        return controller.userModel == null
            ? CircularProgressIndicator()
            : Scaffold(
                body: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  NetworkImage(controller.userModel.pic),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: controller.userModel.name,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                CustomText(
                                  text: controller.userModel.email,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      profileRowBuilder(
                          name: "Edit Profile", icon: Icons.edit, onTap: () {}),
                      profileRowBuilder(
                          name: "Shiping Address",
                          icon: Icons.map,
                          onTap: () {}),
                      profileRowBuilder(
                          name: "Order History",
                          icon: Icons.history,
                          onTap: () {}),
                      profileRowBuilder(
                          name: "Cards",
                          icon: Icons.card_membership,
                          onTap: () {}),
                      profileRowBuilder(
                          name: "Notificaation",
                          icon: Icons.notification_important,
                          onTap: () {}),
                      profileRowBuilder(
                          name: "signOut",
                          icon: Icons.exit_to_app,
                          onTap: () {
                            controller.signOut();
                            Get.offAll(LoginScreen());
                          }),
                    ],
                  ),
                ),
              ));
      },
    );
  }

  profileRowBuilder({IconData icon, String name, Function onTap}) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          width: 40,
          height: 40,
          color: primaryColor.withOpacity(0.2),
          child: Icon(icon),
        ),
        title: CustomText(
          text: name,
        ),
        trailing: name == "signOut"
            ? Text("")
            : Icon(
                Icons.navigate_next,
                color: Colors.black,
              ),
      ),
    );
  }
}
