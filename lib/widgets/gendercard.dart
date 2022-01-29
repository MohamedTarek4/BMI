import 'package:flutter/material.dart';


class GenderCard extends StatelessWidget {
  //inizialization of the attributes

  final IconData icon; //the icon of the Card
  final String iconName; //the name of the Icon

  final Color color; //the color of the Container

  const GenderCard({
    Key? key,
    required this.color,
    required this.icon,
    required this.iconName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        width: (MediaQuery.of(context).size.width) * 0.5 - 25,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              const SizedBox(height: 15),
              Text(
                iconName,
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
