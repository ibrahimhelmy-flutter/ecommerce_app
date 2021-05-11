import 'dart:convert';

import 'package:ecommerce_app/constanse.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController {
  Future<UserModel> get getUser async {
    try {
      UserModel userModel = await _getUserData();
      if (userModel == null) {
        //no user
        return null;
      }
      return userModel;
    } catch (e) {
      print(e.message);
      return null;
    }
  }

//get
  _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(CATCH_USER_DATA);
    print(value);
    //هنا بعمل ديكود للنص عشان احوله لجيسون وبعدين اجيب منه الموديل
    return UserModel.fromjson(json.decode(value));
  }

//set
  setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //هنا لازم احول اليوزر الى جيسون وبعدين اعمله اينكود عشان احفظه ك نص
    await prefs.setString(CATCH_USER_DATA, json.encode(userModel.tojson()));
  }

//to delete data when signOut
  void deleteuser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
