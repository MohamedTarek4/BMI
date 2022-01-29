import 'package:flutter/material.dart';

PreferredSizeWidget appBar(BuildContext context,String title) {
  return AppBar(
    title: Text(
      title,
      style: Theme.of(context).textTheme.headline3,
    ),
    centerTitle: true,
  );
}