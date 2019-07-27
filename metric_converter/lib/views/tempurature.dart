import 'package:flutter/material.dart';

class TemperatureWidget extends StatefulWidget {
  @override
  _TemperatureWidgetState createState() => _TemperatureWidgetState();
}

class _TemperatureWidgetState extends State<TemperatureWidget>{
  double _farenheit = 70;
  
  @override
  Widget build(BuildContext context){
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_farenheit \u00B0F',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      );
  }

}