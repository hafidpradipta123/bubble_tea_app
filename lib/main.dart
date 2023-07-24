import 'package:bubble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tea_app/pages/homepage.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=> BubleTeaShop(),
    builder: (context, child) =>  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: HomePage(),
    ),);
  }
}