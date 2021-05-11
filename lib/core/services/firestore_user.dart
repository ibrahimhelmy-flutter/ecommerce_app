import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/user_model.dart';

class FirestoreUser {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection("users");

  Future<void> adduserToFireStore(UserModel userModel) async {
    return await _userReference.doc(userModel.userId).set(userModel.tojson());
  }

  Future<DocumentSnapshot> getCurrentUser(String uid) async {
    return await _userReference.doc(uid).get();
  }
}
