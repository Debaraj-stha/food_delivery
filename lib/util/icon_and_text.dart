import 'package:fb_clone/util/smallText.dart';
import 'package:flutter/material.dart';
class iconAndText extends StatelessWidget {
  const iconAndText({super.key,required this.icon,required this.text,required this.iconColor});
final IconData icon;
final String text;
// final Color color;
final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,),
        SizedBox(width: 5,),
        smallText(text: text)
      ],
    );
  }
}