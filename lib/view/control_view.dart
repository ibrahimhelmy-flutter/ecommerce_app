import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/core/view_model/controll_view_model.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllView extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                    body: controller.currentScreen,
                    bottomNavigationBar: buttonNvigationBar(),
                  ));
    });
  }

  Widget buttonNvigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: Text("Explore"),
              icon: Image.asset("assets/image/Icon_Explore.png"),
              label: ""),
          BottomNavigationBarItem(
              activeIcon: Text("Cart"),
              icon: Image.asset("assets/image/Icon_Cart.png"),
              label: ""),
          BottomNavigationBarItem(
              activeIcon: Text("Account"),
              icon: Image.asset("assets/image/Icon_User.png"),
              label: ""),
        ],
        currentIndex: controller.navigatorvalue,
        onTap: (index) => controller.changeNavigatorValue(index),
        elevation: 0.0,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
