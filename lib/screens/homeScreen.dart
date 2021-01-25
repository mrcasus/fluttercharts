//import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fluttercharts/screens/bakimList.dart';

//void main() => runApp(MyApp());

class HomeTabScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var data = [
      Sales("Bakım Yapılan", 15),
      Sales("Bakım Yapılmıyan", 30),
    ];

    var series = [
      charts.Series(
          domainFn: (Sales sales, _) => sales.day,
          measureFn: (Sales sales, _) => sales.sold,
          id: 'Sales',
          data: data,
          labelAccessorFn: (Sales sales, _) =>
              '${sales.day}: ${sales.sold.toString()}')
    ];

    var chart = charts.PieChart(
      series,
      defaultRenderer: charts.ArcRendererConfig(
          arcRendererDecorators: [charts.ArcLabelDecorator()]),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 40.0,
          ),
        
          Stack(
            children: [
              Container(
                child: IconButton(),
                height: 250.0,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                   ),
              ),
              SizedBox(height: 250, child: chart),
            ],
          ),

          SizedBox(
            height: 60.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 150.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0.0, 10.0),
                              blurRadius: 10.0)
                        ]),
                  ),
                  Container(
                    alignment: FractionalOffset.topCenter,
                    child: Image(
                      image: AssetImage(
                        'images/maintenance.png',
                      ),
                      height: 100,
                      width: 100,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 150.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0.0, 10.0),
                              blurRadius: 10.0)
                        ]),
                  ),
                ],
              ),
            ],
          ),
          // Text('data')
        ]),
      ),
    );
  }
}

class Sales {
  final String day;
  final int sold;

  Sales(this.day, this.sold);
}
