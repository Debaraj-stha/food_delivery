import 'package:flutter/material.dart';

class smallText extends StatelessWidget {
  const smallText(
      {super.key,
      required this.text,
      this.height=1.2,
      this.size = 12,
      this.color=const Color(0xFF332d2d)});
  final String text;
  final Color? color;
  final double size;
   final double? height;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontFamily: 'Roboto',
          height: height
          ),
    );
  }
}
