import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turist_app/src/presentation/home_page.dart';
import 'package:turist_app/src/presentation/home_page_web.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageWeb(title: 'Home Page'),
    );
  }
}