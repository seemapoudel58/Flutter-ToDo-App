import 'package:flutter/material.dart';
import 'package:seemaflutter/screens/home_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(
          // body: Center(
          //   child: Column(
          //     children:Center [
          //       Text("Hello World"),
          //       Text("Hi My name is this"),
          //     ],
          //   ),
          // ),
          ),
    ); // use 'const' with the constructor to improve perform.//
  }
}
