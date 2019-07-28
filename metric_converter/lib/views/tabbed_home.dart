import 'package:flutter/material.dart';
import 'package:metric_converter/views/tempurature.dart';

class TabbedHomeWidget extends StatelessWidget{
  TabbedHomeWidget({Key key, this.title}) : super(key: key);
  final String title;
  Widget build(BuildContext context){
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'Temperature'),
                Tab(text: 'Weight',),
                Tab(text: 'Distance',),
              ],
            ),
            title: Text(title),
          ),
          body: TabBarView(
            children: [
              TemperatureWidget(),
              Center(child:Text('Weight', style: Theme.of(context).textTheme.display2)),
              Center(child:Text('Distance', style: Theme.of(context).textTheme.display2)),
            ],
          ),
        ),
      );
  }
}

