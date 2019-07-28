import 'package:flutter/material.dart';
import 'views/tabbed_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metric Converter',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: TabbedHomeWidget(title: 'Metric Converter'),
    );
  }
}
