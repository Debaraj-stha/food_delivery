import 'package:fb_clone/util/smallText.dart';
import 'package:flutter/material.dart';
import 'package:fb_clone/model/appColors.dart';
class buttonGroup extends StatefulWidget {
  const buttonGroup({super.key,required this.text,this.textColor=const Color.fromRGBO(255, 255,255,1),this.color=const Color.fromRGBO(255, 255,255,1)});
final String text;
final Color color;
final Color textColor;
  @override
  State<buttonGroup> createState() => _buttonGroupState();
}

class _buttonGroupState extends State<buttonGroup> {
  @override
  Widget build(BuildContext context) {
    return 
                     Container(
                          padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: widget.color,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: smallText(text:widget.text,color:widget.textColor),
                        );
  }
}