import 'package:flutter/material.dart';

class TemperatureWidget extends StatefulWidget {
  @override
  _TemperatureWidgetState createState() => _TemperatureWidgetState();
}

class _TemperatureWidgetState extends State<TemperatureWidget> {
  double _farenheit = 70;
  double get _celsius => (_farenheit - 32) * 5 / 9;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                child: Text(
                  '$_farenheit \u00B0F',
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
            ),
            Divider(),
            Card(
              margin: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                child: Text(
                  '${_celsius.toStringAsFixed(2)} \u00B0C',
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
