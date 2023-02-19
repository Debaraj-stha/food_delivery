// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> UserFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String UserToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    User({
     required  this.id, this.image, required this.name, required this.email,required this.password,this.phone
    });

   String id;
  String name;
  String email;
  String password;
  String? phone;
  String? image;
    factory User.fromJson(Map<String, dynamic> json) => User(
        id:json['_id'],
        name:json['name'],
        image: json['image'],
       email: json['email'],
       password: json['password'],
       phone: json['phone']
    );

    Map<String, dynamic> toJson() => {
        "_id" : id,
        "name" : name,
        "email":email,
        "image":image,
        "password":password,
        "phone":phone
       
    };
}
