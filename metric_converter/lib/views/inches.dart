import 'package:flutter/material.dart';

class InchesWidget extends StatefulWidget {
  @override
  _InchesWidgetState createState() => _InchesWidgetState();
}

class _InchesWidgetState extends State<InchesWidget> {
  double _inches = 36;
  double get _cm => _inches * 2.54;

  void _onIncrement() {
    setState(() {
      if (_inches < 10000) _inches++;
    });
  }

  void _onIncrement10() {
    setState(() {
      if (_inches < 9990) _inches += 10;
    });
  }

  void _onDecrement() {
    setState(() {
      if (_inches > 0) _inches--;
    });
  }

  void _onDecrement10() {
    setState(() {
      if (_inches > 9) _inches -= 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return mq.orientation == Orientation.landscape
        ? _landscapeView(context, mq.size)
        : _portraitView(context, mq.size);
  }

  Widget _portraitView(BuildContext context, Size mediaSize) => Center(
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: mediaSize.height / 20,
              horizontal: mediaSize.width / 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _heading(false, mediaSize.height),
              _inputCard(),
              Divider(),
              _outputCard(),
              ButtonBar(
                mainAxisSize: MainAxisSize.min,
                alignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _addOneButton(),
                  _subtractOneButton(),
                ],
              ),
              ButtonBar(
                mainAxisSize: MainAxisSize.min,
                alignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _addTenButton(),
                  _subtractTenButton(),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _landscapeView(context, Size mediaSize) => Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _heading(true, mediaSize.height),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _inputCard(),
                  VerticalDivider(width: 5),
                  _outputCard(),
                ],
              ),
              ButtonBar(
                mainAxisSize: MainAxisSize.min,
                alignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _addTenButton(),
                  _addOneButton(),
                  _subtractOneButton(),
                  _subtractTenButton(),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _heading(bool isLandscape, double height) => Container(
        child: Visibility(
          visible: height > 640,
          child: Text(
            'Centimeters',
            style: Theme.of(context).textTheme.display2,
          ),
        ),
        decoration: BoxDecoration(),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 0,
        ),
      );

  Widget _inputCard() => Card(
        margin: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Text(
            '$_inches in',
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
            '${_cm.toStringAsFixed(2)} cm',
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      );

  Widget _addOneButton() => RaisedButton(
        child: Text('+1'),
        color: Theme.of(context).accentColor,
        splashColor: Theme.of(context).splashColor,
        textColor: Colors.white,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0)),
        onPressed: _onIncrement,
      );
  Widget _addTenButton() => RaisedButton(
        child: Text('+10'),
        color: Theme.of(context).accentColor,
        splashColor: Theme.of(context).splashColor,
        textColor: Colors.white,
        padding: EdgeInsets.all(0),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0)),
        onPressed: _onIncrement10,
      );
  Widget _subtractOneButton() => RaisedButton(
        child: Text('-1'),
        color: Theme.of(context).accentColor,
        splashColor: Theme.of(context).splashColor,
        textColor: Colors.white,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0)),
        onPressed: _onDecrement,
      );
  Widget _subtractTenButton() => RaisedButton(
        child: Text('-10'),
        color: Theme.of(context).accentColor,
        splashColor: Theme.of(context).splashColor,
        textColor: Colors.white,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0)),
        onPressed: _onDecrement10,
      );
}
