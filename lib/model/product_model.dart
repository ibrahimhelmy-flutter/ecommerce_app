import 'package:ecommerce_app/helper/extention.dart';
import 'package:flutter/material.dart';

class ProductModel {
  final String productId, name, image, description, size, price;
  Color color;
  ProductModel(
      {this.name,
      this.image,
      this.description,
      this.color,
      this.size,
      this.price,this.productId});
  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      color: HexColor.fromHex(map['color']),
      description: map["description"],
      image: map["image"],
      name: map["name"],
      size: map["size"],
      price: map["price"],
      productId: map["productId"],
    );
  }

  tojson() {
    return {
      "color": color,
      "description": description,
      "image": image,
      "name": name,
      "size": size,
      "price": price,
      "productId": productId,
    };
  }
}
