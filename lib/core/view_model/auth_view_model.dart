import 'dart:convert';

import 'package:ecommerce_app/core/services/firestore_user.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart'; //import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();

  String email, password, name;

//make user in nullsafty
  Rxn<User> _user = Rxn<User>();
  String get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    print(
        googleUser); //GoogleSignInAccount:{displayName: ibrahim helmy, email: ibrahim300000@gmail.com, id: 107218428718638264026, photoUrl: https://lh3.googleusercontent.com/a-/AOh14GjF9fwjNBLDeA1FMPD4DzJOfAMag-ofTuDoqj9V3w=s96-c}

    //store email in firebase
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    await _auth.signInWithCredential(credential)
      .then((user) async {
//firestore Cloud
        await saveUserToFirestore(user);
      Get.offAll(() => HomeScreen());

      });
  }

  void faceboksignInMethod() async {
    //, "public_profile", "user_friends"
    final FacebookLoginResult result = await _facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        final graphResponse = await http.get(Uri.parse(
            'https://graph.facebook.com/v2.12/me?fields=first_name,picture&access_token=${accessToken.token}'));

        final faceCridental =
            FacebookAuthProvider.credential(accessToken.token);

        await _auth.signInWithCredential(faceCridental)
          .then((user) async {
//firestore Cloud
        await saveUserToFirestore(user);
      Get.offAll(() => HomeScreen());

      });

        final profile = jsonDecode(graphResponse.body);
        print(profile);
        //setState(() {
        //here we can use  fie=rest name and picture
        print(profile['first_name']);
        print(profile['picture']['data']['url']);

        // });
        print('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  void signInByEmailPassword() async {
    print("$email   $password");

    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim())
       .then((user) async {
//firestore Cloud
        await saveUserToFirestore(user);
      Get.offAll(() => HomeScreen());

      });
    } catch (e) {
      Get.snackbar("Error login Account", e.message,
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.black);
    }
  }

  void createUserEmailPassword() async {
    print("$email   $password");

    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((user) async {
//firestore Cloud
        await saveUserToFirestore(user);
      Get.offAll(() => HomeScreen());

      });

    } catch (e) {
      Get.snackbar("Error Sign Up Account", e.message,
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.black);
    }
  }

  Future<void> saveUserToFirestore(UserCredential user) async {
    
    //firestore Cloud
    UserModel userModwl = UserModel(
        userId: user.user.uid, email: user.user.email, name: name==null?user.user.displayName:name, pic: "");
    
    await FirestoreUser().adduserToFireStore(userModwl);
  }
}
