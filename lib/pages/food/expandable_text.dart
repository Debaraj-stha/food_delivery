import 'package:fb_clone/util/dimension.dart';
import 'package:flutter/material.dart';
class expandableText extends StatefulWidget {
  const expandableText({super.key,required this.text});
final String text;
  @override
  State<expandableText> createState() => _expandableTextState();
}

class _expandableTextState extends State<expandableText> {
  bool isHidden=true;
  var textHeight=300;
  String first="";
  String second="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.text.length>textHeight){
      first=widget.text.substring(0,textHeight.floor());
      second=widget.text.substring(textHeight.floor()+1,widget.text.length);
      setState(() {
        
      });
    }
  else{
    first=widget.text;
    second="";
      setState(() {
        
      });
  }
  }

  @override
  Widget build(BuildContext context) {
    return second.isEmpty?Text(widget.text):Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isHidden?Text(first +"..."):Text(first+second),
        SizedBox(height: 5,),
        InkWell(
            onTap: (){
              setState(() {
                isHidden=!isHidden;
              });
            },
            child: Text(isHidden?"show more":"show less",style: TextStyle(color: Colors.blueAccent),),
        )
      ],
    );
  }
}