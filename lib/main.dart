import 'dart:convert';

import 'package:flutter/material.dart';
import 'model/beverage_model/beverage_models.dart';
import 'screens/HomePage.dart';
import 'screens/beverage_details.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cafe Library',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white70,
      ),
      routes: {
        "/" : (context) => cafeBeverage(),
        //"beverageDetails" : (context) => beverage_details(singleBeverage: beverageModelToJson(json.decode as BeverageModel),),
      },
    );
  }
}