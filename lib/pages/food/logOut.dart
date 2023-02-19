import 'package:fb_clone/util/bigText.dart';
import 'package:fb_clone/util/smallText.dart';
import 'package:flutter/material.dart';

void logOut(BuildContext context) {
  showDialog(context: context, builder: (context)=>AlertDialog(
    // contentPadding: EdgeInsets.zero,
    icon: Center(child: Icon(Icons.error,color: Colors.red,size: 30,)),
    
       title: BigText(text: "Logout"),
       content: smallText(text: "Are you sure want to logout?",size: 15,),
    
    actions: [
      TextButton(onPressed: (){
        Navigator.pop(context);
      }, child: BigText(text: "Cancel",color: Colors.black45,)),
      TextButton(onPressed: (){

      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 19, 114, 192)),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 6,horizontal: 15))
      ),
      child:BigText(text: "OK",color: Colors.white,),)
    ],
  ));
}