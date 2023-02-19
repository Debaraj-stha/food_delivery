import 'dart:convert';
import 'package:fb_clone/model/cartModel.dart';
import 'package:fb_clone/model/category_model.dart';
import 'package:fb_clone/model/itemsModel.dart';
import 'package:fb_clone/model/locationModel.dart';
import 'package:fb_clone/model/resturant_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';

class resturantProvider with ChangeNotifier {
  List<Resturant> _resturants = [];
  List<Resturant> get resturants => _resturants;

  void fetchResturants() async {
    final response = await http
        .get(Uri.parse("http://10.0.2.2:8000/resturant?location=dharan"));
    if (response.statusCode == 200) {
      List resturant = jsonDecode(response.body);
      for (var res in resturant) {
        _resturants.add(Resturant.fromJson(res, id: null));
      }
      notifyListeners();
    } else {
      print(response.body);
    }
  }

  List<Cat> _category = [];
  List<Cat> get category => _category;
  void fetchCategory() async {
    final response = await http.get(Uri.parse("http://10.0.2.2:8000/category"));
    if (response.statusCode == 200) {
      List category = jsonDecode(response.body);
      for (var res in category) {
        _category.add(Cat.fromJson(res));
      }
      notifyListeners();
    } else {
      print(response.body);
    }
  }

  List<Items> _subcategory = [];
  List<Items> get subcategory => _subcategory;
  void fetchSubCategory(String subCategory) async {
    final response = await http.get(Uri.parse(
        "http://10.0.2.2:8000/subCategory?subCategory=${subCategory}"));
    if (response.statusCode == 200) {
      List items = jsonDecode(response.body);
      for (var res in items) {
        _subcategory.add(Items.fromJson(res));
      }
      // print("r"+response.body);
      notifyListeners();
    } else {
      print(response.body);
    }
  }

  List<Resturant> _singleRes = [];
  List<Resturant> get singleRes => _singleRes;
  void fetchSingleResturants(String name) async {
    print("call");
    final response = await http.get(
        Uri.parse("http://10.0.2.2:8000/singleResturant?resturant=${name}"));
    if (response.statusCode == 200) {
      // print(response.body);
      print(response);
      final res = jsonDecode(response.body);
      _singleRes.add(Resturant.fromJson(res, id: "1"));
      notifyListeners();
    } else {
      print(response.body);
    }
  }

  List<Items> _singleResturantItems = [];
  List<Items> get singleResturantItems => _singleResturantItems;
  List<String> subCategories = [];
  void fetchSingleResturantItems(String name) async {
    final response = await http.get(
        Uri.parse("http://10.0.2.2:8000/singleResturantItems?name=${name}"));
    if (response.statusCode == 200) {
      List items = jsonDecode(response.body);
      for (var res in items) {
        _singleResturantItems.add(Items.fromJson(res));
      }
      // print(items);
      subCategories.clear();
      subCategories.addAll(Set.from(
          _singleResturantItems.map((item) => item.subCategory).toSet()));
      print(subCategories);
      notifyListeners();
    } else {
      print(response.body);
    }
    // subCategories.addAll(Set.from(_singleResturantItems.map((iten)=> iten.subCategory).toList()));
  }

  List<Items> _categoryTabItem = [];
  List<Items> get categoryTabItem => _categoryTabItem;

  void fetchCategoryTabItem(String resturant) async {
    final response = await http.get(Uri.parse(
        "http://10.0.2.2:8000/category_tab_item?resturant=${resturant}"));
    if (response.statusCode == 200) {
      List items = jsonDecode(response.body);
      for (var res in items) {
        _categoryTabItem.add(Items.fromJson(res));
      }
      // print("r"+response.body);
      notifyListeners();
    } else {
      print(response.body);
    }
  }

  void addCartItem(String userId, String quantity, String itemId) async {
    final response = await http.post(
        Uri.parse("http://10.0.2.2:8000/addItemToCart"),
        body: {"userId": userId, "quantity": quantity, "itemId": itemId});
    if (response.statusCode == 200) {
      print("success");
    } else {
      print(response.body);
    }
  }

  List<Cart> _cartItems = [];
  List<Cart> get cartItems => _cartItems;
  void getCardItem(String userId) async {
    print(userId);
    final response = await http
        .get(Uri.parse("http://10.0.2.2:8000/cartItem?userId=$userId"));
    if (response.statusCode == 200) {
      List items = jsonDecode(response.body);
      _cartItems = [];
      for (var item in items) {
        _cartItems.add(Cart.fromJson(item));
      }
      notifyListeners();
    } else {
      print(response.body);
    }
  }

  void deleteCartItem(String cartId) async {
    print("id" + cartId);
    final response = await http.post(
        Uri.parse("http://10.0.2.2:8000/deleteItem"),
        body: {"cartId": cartId});

    if (response.statusCode == 200) {
      // print(response.body);
      _cartItems.removeAt(findIndex(cartId));
      notifyListeners();
    } else {
      print("error");
    }
  }

  int findIndex(String id) {
    int index = -1;
    for (int i = 0; i < _cartItems.length; i++) {
      if (cartItems[i].id == id) {
        index = i;
        break;
      }
    }
    return index;
  }

  int _quantity = 1;
  late int rate;
  late int _price;
  int get quantity => _quantity;
  int get price => _price;
  void resetItems() {
    _quantity = 1;
  }

  void increaseQuantity(int q, int p) {
    _quantity = 1;
    rate = p;
    if (q < 10) {
      _quantity = q + 1;
      _price = rate * _quantity;
      notifyListeners();
    } else {
      Fluttertoast.showToast(
          msg: "You cannot order more than 10 quantaty  at a time!!!",
          backgroundColor: Colors.green,
          fontSize: 16,
          textColor: Colors.white,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_SHORT);
      notifyListeners();
    }
  }

  void decreaseQuantity(int q, int p) {
    if (q > 1) {
      _quantity = q - 1;
      _price = rate * quantity;
      notifyListeners();
    } else {
      Fluttertoast.showToast(
          msg: "You cannot  decrease less than 1",
          backgroundColor: Colors.green,
          fontSize: 16,
          textColor: Colors.white,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_SHORT);
      notifyListeners();
    }
  }

  List<Map<String, String>> itemList = [];
 void updateItem(String quantity, String rate, String userId, String itemId) {
 
  bool itemExists = false;
  int index = -1;
  for (int i = 0; i < itemList.length; i++) {
    if (itemList[i]['itemId'] == itemId && itemList[i]['userId'] == userId) {
      itemExists = true;
      index = i;
      break;
    }
  }
int quantityInt = int.parse(quantity);
  int currentQuantity = 0;
  print(quantityInt);
  if (itemExists) {
    currentQuantity = int.parse(itemList[index]['quantity']!);
    if(currentQuantity<10){
   int sum=quantityInt+currentQuantity;
    itemList[index]['quantity']=sum.toString();
    notifyListeners();
  }
  else{
    Fluttertoast.showToast(
          msg: "You cannot order more than 10 quantaty  at a time!!!",
          backgroundColor: Colors.green,
          fontSize: 16,
          textColor: Colors.white,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_SHORT);
      notifyListeners();
    
  }
  } else {
    itemList.add({
      "rate": rate,
      "userId": userId,
      "itemId": itemId,
      "quantity": quantity
    });
  }
  notifyListeners();
  // print(itemList);

 }
 void decreaseListQuantity(String itemId,String quantity,String userId,String rate){
  bool isExist=false;
  int index=-1;
  for(int i=0;i<itemList.length;i++){
    if(itemList[i]['itemId']==itemId && itemList[i]['userId']==userId){
      isExist=true;
      index=i;
      break;
    }
  }
  if(isExist){
    int intQuantity=int.parse(itemList[index]['quantity']!);
   int currentQuantity=0;
    if(intQuantity>1){
      currentQuantity=intQuantity-1;
      itemList[index]['quantity']=currentQuantity.toString();
      notifyListeners();
    }
    else{
       Fluttertoast.showToast(
          msg: "You cannot  decrease less than 1",
          backgroundColor: Colors.green,
          fontSize: 16,
          textColor: Colors.white,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_SHORT);
      notifyListeners();
    }
  }
 }
 Map<String, String>? getItem(String itemId){
  for (int i = 0; i < itemList.length; i++) {
    if (itemList[i]['itemId'] == itemId) {
      return itemList[i];
    }
  }
  return null;
 }
 void decreaseCartItem(String userId,String itemId,String quantity)async{
  int intQuantity=int.parse(quantity)-1;
  final response=await http.post(Uri.parse("http://10.0.2.2:8000/decreaseCartItem"),body:{
    "userId":userId,
    "itemId":itemId,
    "quantity":intQuantity.toString(),
  });
  if(response.statusCode == 200){
    print("success");
  }
  else{
    print("error "+response.body);
  }
  notifyListeners();
 }

String country="";
 void getLocationData()async{
  print("called getlocation data");
    List<Placemark> placemark=await placemarkFromCoordinates(LocationModel.lat,LocationModel.long);
    print("placemark" + placemark.toString());
    country=placemark[0].country!;
  }
  List<Resturant> _nearByRes=[];
  List<Resturant> get nearByRes=>_nearByRes;
  void fetchNearByResturant(String location) async{
    final response=await http.get(Uri.parse("http://10.0.2.2:8000/nearByResturant?location=$location"));
    if(response.statusCode==200){
      List data=jsonDecode(response.body);
      for(var res in data){
        _nearByRes.add(Resturant.fromJson(res, id: "res"));
      }
      notifyListeners();
    }
    else{
      print("no vendor found near you");
      notifyListeners();
    }
  }
}
