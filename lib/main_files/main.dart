import 'package:e_commerce_demo/resources/resources.dart';

import '../utiles/routes.dart';
import 'package:flutter/material.dart';


// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(color: Colors.black),
                centerTitle: true,
                elevation: 0)),
        initialRoute: '/');
  }
}
