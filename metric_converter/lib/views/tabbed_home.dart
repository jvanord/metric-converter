import 'package:flutter/material.dart';
import 'package:metric_converter/views/miles.dart';
import 'package:metric_converter/views/tempurature.dart';

class TabbedHomeWidget extends StatelessWidget{
  TabbedHomeWidget({Key key, this.title}) : super(key: key);
  final String title;
  Widget build(BuildContext context){
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'Temperature'),
                Tab(text: 'Weight',),
                Tab(text: 'Miles',),
                Tab(text: 'Feet',),
              ],
            ),
            title: Text(title),
          ),
          body: TabBarView(
            children: [
              TemperatureWidget(),
              Center(child:Text('Weight', style: Theme.of(context).textTheme.display2)),
              MilesWidget(),
              Center(child:Text('Short Distance', style: Theme.of(context).textTheme.display2)),
            ],
          ),
        ),
      );
  }
}

