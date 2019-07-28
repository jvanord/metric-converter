import 'package:flutter/material.dart';

class TemperatureWidget extends StatefulWidget {
  @override
  _TemperatureWidgetState createState() => _TemperatureWidgetState();
}

class _TemperatureWidgetState extends State<TemperatureWidget> {
  double _farenheit = 68;
  double get _celsius => (_farenheit - 32) * 5 / 9;

  void _onIncrement() {
    setState(() {
      _farenheit++;
    });
  }

  void _onDecrement() {
    setState(() {
      _farenheit--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.landscape
        ? _landscapeView()
        : _portraitView();
  }

  Widget _portraitView() => Center(
        child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _inputCart(),
              Divider(),
              _outputCard(),
              _buttonBar(context)
            ],
          ),
        ),
      );

  Widget _landscapeView() => Center(child: Text('Landscape'));

  Widget _inputCart() => Card(
        margin: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          child: Text(
            '$_farenheit \u00B0F',
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      );

  Widget _outputCard() => Card(
        margin: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          child: Text(
            '${_celsius.toStringAsFixed(2)} \u00B0C',
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      );

  Widget _buttonBar(BuildContext context) => ButtonBar(
        mainAxisSize: MainAxisSize.min,
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            child: Text('+1'),
            color: Theme.of(context).accentColor,
            splashColor: Theme.of(context).splashColor,
            textColor: Colors.white,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0)),
            onPressed: _onIncrement,
          ),
          RaisedButton(
            child: Text('-1'),
            color: Theme.of(context).accentColor,
            splashColor: Theme.of(context).splashColor,
            textColor: Colors.white,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0)),
            onPressed: _onDecrement,
          ),
        ],
      );
}
