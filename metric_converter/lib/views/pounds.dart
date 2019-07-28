import 'package:flutter/material.dart';

class PoundsWidget extends StatefulWidget {
  @override
  _PoundsWidgetState createState() => _PoundsWidgetState();
}

class _PoundsWidgetState extends State<PoundsWidget> {
  double _pounds = 150;
  double get _kilograms => _pounds / 2.205;

  void _onIncrement() {
    setState(() {
      _pounds++;
    });
  }

  void _onDecrement() {
    setState(() {
      _pounds--;
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
          'Weight',
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
            '$_pounds lb',
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
            '${_kilograms.toStringAsFixed(2)} kg',
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