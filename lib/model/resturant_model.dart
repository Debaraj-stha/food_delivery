// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<Resturant> ResturantFromJson(String str) => List<Resturant>.from(json.decode(str).map((x) => Resturant.fromJson(x, id: null)));

String ResturantToJson(List<Resturant> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Resturant {
    Resturant({
     required  this.id, required this.image, required this.resturantName, required this.location,required this.openTime,required this.closeTime
    });

   String id;
  String resturantName;
  String location;
  String image;
  String openTime;
  String closeTime;
    factory Resturant.fromJson(Map<String, dynamic> json, {required id}) => Resturant(
        id:json['_id'],
        resturantName:json['resturantName'],
        image: json['image'],
        location: json['location'],
        openTime: json['openTime'],
        closeTime: json['closeTime']
    );

    Map<String, dynamic> toJson() => {
        "_id" : id,
        "resturantName" : resturantName,
        "location":location,
        "image":image,
        "openTime":openTime,
        "closeTime":closeTime
       
    };
}
