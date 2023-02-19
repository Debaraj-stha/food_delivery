import 'package:fb_clone/util/smallText.dart';
import 'package:flutter/material.dart';

class changePassword extends StatefulWidget {
  const changePassword({super.key});

  @override
  State<changePassword> createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  TextEditingController current = TextEditingController();
  TextEditingController newP = TextEditingController();
  TextEditingController confP = TextEditingController();
  bool isObsecured = false;
  RegExp passwordRegex =
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$');
  bool isValid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 123, 29),
        leading: BackButton(color: Colors.white),
        title: Text("Chage Password"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: inputField(current, "Current Password")),
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: inputField(newP, "New Password"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: inputField(confP, "Conform Password"),
            ),
            ElevatedButton(onPressed: (){

            }, child: smallText(text:"Update Password",color: Colors.white,size: 16,),
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 25, 123, 29),
              minimumSize: Size.fromHeight(50)
            ),
            )
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
            side: BorderSide(color: Color.fromARGB(255, 25, 123, 29))),
        child: TextFormField(
          obscureText: isObsecured,
          controller: controller,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
          validator: (value) {
            if (value!.isEmpty) {
              isValid = true;
              return "This field is required";
            }

            isValid = false;
            return null;
          },
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              border: InputBorder.none,
              hintText: type,
              suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      isObsecured = !isObsecured;
                    });
                  },
                  icon: Icon(isObsecured
                      ? Icons.remove_red_eye_sharp
                      : Icons.emergency_share_sharp)),
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
