import 'package:flutter/material.dart';
class mediumText extends StatelessWidget {
  const mediumText({super.key,required this.text,required this.color,this.size=15});
  final String text;
final Color color;
final double size;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: color,fontSize: size,height: 1.2),);
  }
}