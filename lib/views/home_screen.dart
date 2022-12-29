import '../resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/flavor.dart';
import '../widgets/home_screen_widgets.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    style:
                        TextStyle(color: Color.fromARGB(255, 162, 166, 171)))),
          ),
          mainCardListView(context,
              data: F.appFlavor == FlavorType.release
                  ? otherProductList
                  : laptopList,
              isMainView: true),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: showMoreData(
                firstWidget: const Text('Recently Viewed',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                secondWidget: const Text('See all',
                    style:
                        TextStyle(color: Color.fromARGB(255, 162, 166, 171)))),
          ),
          mainCardListView(context, data: phoneList, isMainView: false),
        ]),
      ),
    );
  }
}
