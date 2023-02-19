import 'package:fb_clone/util/dimension.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  const BigText(
      {super.key,
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 20,
      this.color});
  final String text;
  final Color? color;
  final double size;
  final TextOverflow overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 1,
      style: TextStyle(

          color: color,
          fontSize:size==0? dimension.font20:size,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400),
    );
  }
}
