import 'package:e_commerce_demo/views/upcoming_task.dart';
import 'package:flutter/material.dart';

import '../resources/resources.dart';
import '../widgets/home_screen_widgets.dart';
import 'cart_screen.dart';
import 'home_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FirstScreen(),
    CartScreen(),
    ComingSoon(),
    ComingSoon(),
  ];

  List appTitle = [
    appbarSearchField(),
    const Text('Cart', style: TextStyle(fontWeight: FontWeight.bold)),
    null,
    null
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appTitle.elementAt(_selectedIndex),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedIconTheme:
            const IconThemeData(color: Color.fromARGB(255, 206, 206, 206)),
        unselectedLabelStyle:
            const TextStyle(color: Color.fromARGB(255, 206, 206, 206)),
        items: bottomSheetData
            .map(
              (e) => BottomNavigationBarItem(
                  icon: Icon(e.iconData), label: e.title),
            )
            .toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 57, 199, 165),
        onTap: _onItemTapped,
      ),
    );
  }
}
