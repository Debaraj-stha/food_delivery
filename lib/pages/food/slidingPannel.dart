import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
class slidingPanel extends StatelessWidget {
  const slidingPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SlidingUpPanel(
      minHeight: 100,
      maxHeight: 400,
    
      panel: Center(
        child: Text("This is the sliding Widget"),
      ),
      collapsed: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
          color: Colors.white,
        ),
      ),
      body: Center(child: Text("this is main body"),),    )
    );
  }
}