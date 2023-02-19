import 'package:flutter/material.dart';
class appIcon extends StatefulWidget {
  const appIcon({super.key,required this.icon, this.size=30, this.color=const Color(0xFF756d54),this.backGroundcolor=const Color(0xFFfcf4e4)});
final IconData icon;
final Color color;
final Color backGroundcolor;
final double size;
  @override
  State<appIcon> createState() => _appIconState();
}

class _appIconState extends State<appIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.size/2),
        color: widget.backGroundcolor
      ),
      child: Icon(widget.icon,color: widget.color,size:16,),
    );
  }
}