import 'package:fb_clone/model/locationModel.dart';
import 'package:fb_clone/model/userModel.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class profileProvider with ChangeNotifier{
List<User> _user=[];
List<User> get user=>_user;
void setUser(value){
  _user.add(User.fromJson(value));
  notifyListeners();
}
Future<void> getLocation() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionStatus;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }
    if (!_serviceEnabled) {
      return;
    }
    _permissionStatus = await location.hasPermission();
    if (_permissionStatus == PermissionStatus.denied) {
      _permissionStatus = await location.requestPermission();
      if (_permissionStatus != PermissionStatus.granted) {
        return;
      }
    }
    _locationData=await location.getLocation();
   
     LocationModel.lat=_locationData.latitude!;
     LocationModel.long=_locationData.latitude!;
     print(_locationData);
     
  }
  
}