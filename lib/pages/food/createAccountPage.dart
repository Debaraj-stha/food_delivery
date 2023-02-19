import 'dart:convert';

import 'package:fb_clone/home/main_page.dart';
import 'package:fb_clone/model/userModel.dart';
import 'package:fb_clone/pages/food/login.dart';
import 'package:fb_clone/util/bigText.dart';
import 'package:fb_clone/util/smallText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
class createAccountPage extends StatefulWidget {
  const createAccountPage({super.key});

  @override
  State<createAccountPage> createState() => _createAccountPageState();
}

class _createAccountPageState extends State<createAccountPage> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  RegExp emailRegex = RegExp(r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
  bool isValid = false;
  bool isObsecured=true;
  Future<void> createAccount()async{
    String email=emailController.text;
    String phone=passwordController.text;
    String password=passwordController.text;
     String name=nameController.text;
  final response=await http.post(Uri.parse("http://10.0.2.2:8000/create_user"),body:{
    "email":email,
    "phone":phone,
    "password":password,
    "name":name
  });
  if(response.statusCode==200){
    print(response.body);
    Map<String,dynamic> responseData=jsonDecode(response.body);
    String name=responseData['name'];
    String email=responseData['email'];
    String password=responseData['password'];
    String _id=responseData['_id'];
    User user=User(id: _id, name: name, email: email, password: password);
    await SessionManager().set("user",user);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>mainPage()));

  }
  else{
    print("server error"+response.body);
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 123, 29),
        leading: BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 6),
          child: Column(
            children: [
              BigText(text: "Join Us"),
              smallText(text: "Create an account now"),
              Form(
                key: _formKey,
                child: Column(
                    children: [
                      inputField(nameController, "Name"),
                      SizedBox(height: 8,),
                      inputField(emailController, "Email"),
                      SizedBox(height: 8,),
                      inputField(phoneController, "Phone"),
                      SizedBox(height: 8,),
                      inputField(passwordController, "Password"),
                      SizedBox(height: 8,),
                      ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          createAccount();
                        } else {
                          setState(() {
                            isValid = true;
                          });
                        }
                      },
                      child: BigText(text:"Create Account",size: 16,),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 25, 123, 29),
                          minimumSize: Size.fromHeight(50)),
                    ),
                    ],
                )
              ),
              SizedBox(height: 8,),
              BigText(text: "OR",size: 16,),
              // SizedBox(height: 8,),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
              }, child: BigText(text: "Already have an Account",size:16 ,color: Colors.black,))
            ],
          ),
        ),
      ),
    );
  }
  Widget inputField(controller, type) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Color.fromARGB(255, 25, 123, 29))),
        child: TextFormField(
         obscureText: type=="Password"?isObsecured:false,
          keyboardType:
              type == "Email" ? TextInputType.emailAddress : type=="Phone"?TextInputType.phone:TextInputType.text,
          controller: controller,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
              validator: (value) {
                if(value!.isEmpty){
                  isValid=true;
                  return "This field is required";
                }
                if(type=="Email"){
                if(emailRegex.hasMatch(value)){
                  isValid=false;
                }
                else {
                isValid=true;
                return 'Invalid email addresss';
              }
                }
              isValid= false;
              return null;
              },
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              border: InputBorder.none,
              hintText: type,
              suffix: type=="Password"?IconButton(onPressed: (){
                  setState(() {
                    isObsecured=!isObsecured;
                  });
              }, icon: Icon(isObsecured?Icons.remove_red_eye_sharp:Icons.emergency_share_sharp)):Text(""),
              hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
          cursorColor: Color.fromARGB(255, 25, 123, 29),
        ),
      ),
    );
  }
}