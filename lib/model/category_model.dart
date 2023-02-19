import 'dart:convert';

List<Cat> CatFromJson(String str) => List<Cat>.from(json.decode(str).map((x) => Cat.fromJson(x)));

String CatToJson(List<Cat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Cat {
  Cat({required this.id, required this.doc});
  String id;
  Doc doc;

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
        id: json['_id'],
        doc: Doc.fromJson(json["doc"]));

  Map<String, dynamic> toJson() =>
      {"_id": id, "doc": doc.toJson()};
}

class Doc {
  String id;
  String category;
  String subCategory;
  String name;
  String restaurantName;
  int rate;
  int price;
  String image;

  Doc({
    required this.id,
    required this.category,
    required this.subCategory,
    required this.name,
    required this.restaurantName,
    required this.rate,
    required this.price,
    required this.image,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
      id: json['_id'],
      category: json['category'],
      subCategory: json['subCategory'],
      name: json['name'],
      restaurantName: json['resturantName'],
      rate: json['rate'],
      price: json['price'],
      image: json['image'],
    );
  
  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "category": category,
        "subCategory": subCategory,
        "image": image,
        "rate": rate,
        "price": price,
        "resturantName": restaurantName
      };
}
