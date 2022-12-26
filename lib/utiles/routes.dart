import 'package:e_commerce_demo/model/product_detail_model.dart';
import 'package:e_commerce_demo/views/detail_screen.dart';
import 'package:flutter/material.dart';
import '../views/bottom_navigation_bar.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const MyHomePage());
      case "/detail":
        final args = setting.arguments as ProductDetailModel;
        return MaterialPageRoute(
            builder: (context) => DetailScreen(productDetailModel: args));
      default:
        return MaterialPageRoute(builder: (context) => const MyHomePage());
    }
  }
}
