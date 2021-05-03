import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Secondpage extends StatelessWidget {
  AuthViewModel viewModel = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text(viewModel.counter.value.toString())),
          TextButton(
              onPressed: () {
                viewModel.increement();
              },
              child: Text("Add"))
        ],
      ),
    );
  }
}
