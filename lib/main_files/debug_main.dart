import 'package:e_commerce_demo/resources/resources.dart';
import 'package:flutter/material.dart';

import '../widgets/flavor.dart';
import 'main.dart';

void main() {
  F.appFlavor = FlavorType.debug;
  runApp(const MyApp());
}
