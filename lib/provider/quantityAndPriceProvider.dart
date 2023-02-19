import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class quatityAndPriceProvider with ChangeNotifier{
  int _quantity=1;
  int rate=140;
  int _price=140;
  int get quantity=>_quantity;
  int get price => _price;
  void increaseQuantity(int q){
    if(q<10){
    _quantity=q+1;
    _price=rate*_quantity;
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
        toastLength: Toast.LENGTH_SHORT
        );
         notifyListeners();
    }
  }
  void decreaseQuantity(int q){
    if(q>1){
    _quantity=q-1;
    _price=rate*quantity;
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
        toastLength: Toast.LENGTH_SHORT
        );
         notifyListeners();
    }
  }
}