


class CartProductModel {
  final String productId ,name, image, price;
  int quentity;
  CartProductModel(
      {this.name,
      this.image,
     this.price,
     this.quentity,
     this.productId
     });
  factory CartProductModel.fromJson(Map<String, dynamic> map) {
    return CartProductModel(
  
      image: map["image"],
      name: map["name"],
      quentity: map["quentity"],
      price: map["price"],
      productId: map["productId"],
    );
  }

  tojson() {
    return {
 
      "image": image,
      "name": name,
       "quentity":quentity,
      "price": price,
      "productId": productId,
      
    };
  }
}
