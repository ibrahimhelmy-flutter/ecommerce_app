import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  var counter = 0.obs;

  void increement() {
    counter++;
  }
}
