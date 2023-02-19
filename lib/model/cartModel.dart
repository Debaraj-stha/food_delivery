// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<Cart> CartFromJson(String str) => List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String CartToJson(List<Cart> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cart {
    Cart({
     required  this.id, required this.image, required this.quantity, required this.name,required this.rate
    });

   String id;
  String name;
 String image;
 int quantity;
 int rate;
    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id:json['id'],
        name:json['name'],
        image: json['image'],
       quantity: json['quantity'],
       rate:json['rate'],
    );

    Map<String, dynamic> toJson() => {
        "_id" : id,
        "name" : name,
        "quantity":quantity,
        "image":image,
        "rate":rate
       
    };
}
