// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:personal_information/Screens/information.dart';
import 'package:personal_information/Screens/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/register',
      routes: {
        RegisterScreen.routeName: (context) => RegisterScreen(),
        InformationScreen.routeName: (context) => InformationScreen(),
      },
    );
  }
}
