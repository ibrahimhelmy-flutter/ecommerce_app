class CategoryModel {
  final String name, image;

  CategoryModel({this.name, this.image});

  factory CategoryModel.fromjson(Map<String, dynamic> map) {
    return CategoryModel(image: map['image'], name: map['name']);
  }

  tojson() {
    return {"name": name, "image": image};
  }
}
