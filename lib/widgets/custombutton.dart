import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final IconData icon;
  void Function() buttonFunction;
  final String type;
  final String nameFunction;

  CustomButton({
    Key? key,
    required this.icon,
    required this.type,
    required this.buttonFunction,
    required this.nameFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45.0,
      height: 45.0,
      child: FloatingActionButton(
        heroTag: Text(type + nameFunction),
        onPressed: buttonFunction,
        child: Icon(icon, size: 30),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
