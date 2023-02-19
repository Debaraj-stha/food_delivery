import 'package:fb_clone/util/smallText.dart';
import 'package:flutter/material.dart';
class tab extends StatelessWidget {
  const tab({super.key,required this.text,required this.index,required this.conIn});
final String text;
final int conIn;
final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
                      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(offset: Offset(4,4),color: Color.fromARGB(255, 108, 107, 107),blurRadius: 0.5)
                        ],
                        color:conIn==index? Colors.green:Colors.white,
                        // border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                        child: smallText(text: text,color:conIn==index? Colors.white:Colors.black,size: 16,),
                  );
  }
}