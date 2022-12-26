import '../resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/home_screen_widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appbarSearchField()),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: SingleChildScrollView(
          child: Column(children: [
            categoryListBody(context),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: showMoreData(
                  firstWidget: const Text('Hot Sales',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  secondWidget: const Text('See all',
                      style: TextStyle(
                          color: Color.fromARGB(255, 162, 166, 171)))),
            ),
            mainCardListView(context, data: laptopList, isMainView: true),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: showMoreData(
                  firstWidget: const Text('Recently Viewed',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  secondWidget: const Text('See all',
                      style: TextStyle(
                          color: Color.fromARGB(255, 162, 166, 171)))),
            ),
            mainCardListView(context, data: phoneList, isMainView: false),
          ]),
        ),
      ),
    );
  }
}
