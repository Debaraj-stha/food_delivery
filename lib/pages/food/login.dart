import 'package:fb_clone/home/main_page.dart';
import 'package:fb_clone/pages/food/createAccountPage.dart';
import 'package:fb_clone/util/bigText.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailCpmtroller = TextEditingController();
  TextEditingController passwordCpmtroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
  bool isValid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: BackButton(color: Colors.white),
        
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  inputField(emailCpmtroller, "email"),
                  SizedBox(
                    height: 8,
                  ),
                  inputField(passwordCpmtroller, "password"),
                  SizedBox(
                    height: 8,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          child: Text(
                        "Forget Password?",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ))),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>mainPage()));
                      } else {
                        setState(() {
                          isValid = true;
                        });
                      }
                    },
                    child: Text("Login"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: Size.fromHeight(50)),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 8,
            ),
            BigText(
              text: "OR",
              size: 18,
            ),
            // SizedBox(height: 8,),
            TextButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>createAccountPage()));
                },
                child: BigText(
                  text: "Create an Account",
                  size: 18,
                  color: Colors.black,
                ))
          ],
        ),
      ),
    );
  }

  Widget inputField(controller, type) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Colors.green)),
        child: TextFormField(
          keyboardType:
              type == "email" ? TextInputType.emailAddress : TextInputType.text,
          controller: controller,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
              validator: (value) {
                if(value!.isEmpty){
                  isValid=true;
                  return "This field is required";
                }
                if(type=="email"){
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
              hintText: type=="email"?"Email address":"Password",
              hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
          cursorColor: Colors.green,
        ),
      ),
    );
  }
}
