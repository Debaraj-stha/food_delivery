// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<Items> ItemsFromJson(String str) =>
    List<Items>.from(json.decode(str).map((x) => Items.fromJson(x)));

String ItemsToJson(List<Items> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Items {
  Items(
      {
        required this.description,
        required this.id,
      required this.image,
      required this.name,
      required this.restaurantName,
      required this.rate,
      required this.price,
      required this.category,
      required this.subCategory
      });
String description;
  String id;
  String category;
  String subCategory;
  String image;
  String name;
  int rate;
  int price;
  String restaurantName;
  factory Items.fromJson(Map<String, dynamic> json) => Items(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      restaurantName: json['resturantName'],
      rate: json['rate'],
      price: json['price'],
      category: json['category'],
      subCategory: json['subCategory'],
      description: json['description']
      );

  Map<String, dynamic> toJson() => {
    "description":description,
        "_id": id,
        "name": name,
        "restaurantName": restaurantName,
        "image": image,
        "category": category,
        "subCategory": subCategory,
        "rate":rate,
        "price":price
      };
}
