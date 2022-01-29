import 'package:flutter/material.dart';

class TextModel extends StatelessWidget {
   TextModel({ Key? key , required this.text, required this.color, required this.size}) : super(key: key);
  final String text;
   Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}