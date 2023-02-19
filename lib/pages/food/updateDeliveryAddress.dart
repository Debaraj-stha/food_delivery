import 'package:fb_clone/util/bigText.dart';
import 'package:fb_clone/util/smallText.dart';
import 'package:flutter/material.dart';

class updateDeliveryAddress extends StatefulWidget {
  const updateDeliveryAddress({super.key});

  @override
  State<updateDeliveryAddress> createState() => _updateDeliveryAddressState();
}

class _updateDeliveryAddressState extends State<updateDeliveryAddress> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 25, 123, 29),
        title: BigText(
          text: "Update Delivery address",
          color: Colors.white,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: inputField(controller),
            ),
            ElevatedButton(
              onPressed: () {},
              child: BigText(
                text: "Pick from map",
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 25, 123, 29),
                  minimumSize: Size.fromHeight(50)),
            ),
            ElevatedButton(
              onPressed: () {},
              child: BigText(
                text: "Save",
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 25, 123, 29),
                  minimumSize: Size.fromHeight(50)),
            )
          ],
        ),
      ),
    );
  }

  Widget inputField(controller) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Colors.green)),
        child: TextFormField(
          //  initialValue:controller.text==null? "Current deliver address":controller.text,
          controller: controller,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),

          decoration: InputDecoration(
            label: smallText(text: "Address"),
            contentPadding: EdgeInsets.all(10),
            border: InputBorder.none,
          ),
          cursorColor: Colors.green,
        ),
      ),
    );
  }
}
