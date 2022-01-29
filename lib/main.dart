import 'package:flutter/material.dart';

//imported screens
import 'package:body_mass_index/screens/myhome.dart';
//imported package
import 'package:get/get.dart';


void main() {
  runApp(
    GetMaterialApp(
      title: "Body Mass Index Application",
      debugShowCheckedModeBanner: false,
      home:const MyHomePage(),

      theme: ThemeData(
        //the primary color of the application
        primarySwatch: Colors.teal,

        //the color of the background
        canvasColor: Colors.black,

        //the icon theme
        iconTheme:const IconThemeData(color: Colors.white, size: 90.0),

        //the style of the text
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 25.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),

          headline3: TextStyle(
            fontSize: 22.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
