class UserModel {
  final String userId, email, name, pic;

  UserModel({this.userId, this.email, this.name, this.pic});

  factory UserModel.fromjson(Map<String, dynamic> data) {
    return UserModel(
        email: data['email'],
        name: data['name'],
        pic: data['pic'],
        userId: data['userId']);
  }

  tojson() {
    return {'email': email, 'name': name, 'pic': pic, "userId": userId};
  }
}
