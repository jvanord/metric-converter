import 'package:flutter/material.dart';

class MilesWidget extends StatefulWidget {
  @override
  _MilesWidgetState createState() => _MilesWidgetState();
}

class _MilesWidgetState extends State<MilesWidget> {
  double _miles = 55;
  double get _kilometers => _miles * 1.609;

  void _onIncrement() {
    setState(() {
      _miles++;
    });
  }

  void _onDecrement() {
    setState(() {
      _miles--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.landscape
        ? _landscapeView(context)
        : _portraitView(context);
  }

  Widget _portraitView(BuildContext context) => Center(
        child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _heading(false),
              _inputCard(),
              Divider(),
              _outputCard(),
              _buttonBar(context)
            ],
          ),
        ),
      );

  Widget _landscapeView(context) => Center(
        child: Container(
          child: Column(
            children: <Widget>[
              _heading(true),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _inputCard(),
                  VerticalDivider(width: 5),
                  _outputCard(),
                ],
              ),
              _buttonBar(context)
            ],
          ),
        ),
      );

  Widget _heading(bool isLandscape) => Container(
        child: Text(
          'Long Distance',
          style: Theme.of(context).textTheme.display2,
        ),
        decoration: BoxDecoration(),
        padding: EdgeInsets.symmetric(
          horizontal: 10, 
          vertical: isLandscape 
            ? 10 
            : 30),
      );

  Widget _inputCard() => Card(
        margin: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Text(
            '$_miles mi',
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      );

  Widget _outputCard() => Card(
        margin: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Text(
            '${_kilometers.toStringAsFixed(2)} km',
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
