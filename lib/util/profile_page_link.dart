import 'package:fb_clone/util/appIcon.dart';
import 'package:fb_clone/util/bigText.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
class profilePageList extends StatefulWidget {
  const profilePageList({super.key, this.isBorder=true,required this.text,required this.icon,this.icon1=Icons.arrow_drop_down_outlined,this.color=const Color(000),required this.callback});
final String text;
final IconData icon;
final IconData icon1;
final  callback;
final Color color;
final bool isBorder;
  @override
  State<profilePageList> createState() => _profilePageListState();
}

class _profilePageListState extends State<profilePageList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>widget.callback));
      },
      child: Container(
                 decoration: BoxDecoration(
                    //  color:Colors.red,
                        // border: Border(
                          
                          // bottom: widget.isBorder==true?BorderSide(color: Colors.black12):BorderSide.none
                        // )
                  ),
                  child: Row(
                    children: [
                      appIcon(icon: widget.icon,color: Colors.black,backGroundcolor: Colors.white,),
                      SizedBox(width: 4,),
                      BigText(text: widget.text,color: widget.color,size: 18,),
                      Spacer(),
                      IconButton(onPressed: (){
                        widget.callback;
                      }, icon: Icon(widget.icon1))
                    ],
                  ),
      ),
    );
  }
}