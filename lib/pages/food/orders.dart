import 'package:fb_clone/util/bigText.dart';
import 'package:flutter/material.dart';
class myOrders extends StatefulWidget {
  const myOrders({super.key});

  @override
  State<myOrders> createState() => _myOrdersState();
}

class _myOrdersState extends State<myOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: BigText(text: "My Orders",size: 22,),
      ),
      body: Center(
        child: Column(
          children: [
            BigText(text: "no order founds")
          ],
        ),
      ),
    );
  }
}