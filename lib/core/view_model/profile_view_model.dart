import 'package:ecommerce_app/helper/local_storage_data.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  //to get instance of localStorageData
  final LocalStorageData localStorageData = Get.find();
  UserModel _userModel;
 UserModel get userModel => _userModel;

  void getCurrentUser() async {
  await  localStorageData.getUser.then((value) => {
      _userModel=value

    });
    update();
  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteuser();
  }
}
