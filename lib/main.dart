import 'package:flutter/material.dart';
import 'package:webapp/configs/config.dart';
import 'package:webapp/screens/home_page.dart';

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
        title: 'Web App',
        theme: ThemeData(
          primarySwatch: Config.colors.primaryColor,
          fontFamily: 'Arapey',
        ),
        home: HomePage());
  }
}
