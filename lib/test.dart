
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'chart.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Test(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
     /* body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 50,
              color: Colors.amber,
            ),
            Text('49', style: TextStyle(),)
          ],
        ),
      ),*/
        body: Column(
          children: [
            Container(
              height: 200,
              child: Center(
                  child: Stack(
                      children: [
                        getTrackerBarChart(false),
                        SfCartesianChart(
                          plotAreaBorderWidth: 0,
                          primaryYAxis: NumericAxis(
                              isVisible: true,
                              majorGridLines: MajorGridLines(width: 0),
                              minimum: 0,
                              maximum: 1
                          ),
                          primaryXAxis: NumericAxis(
                            majorGridLines: MajorGridLines(width: 0),
                            majorTickLines: MajorTickLines(size: 0),
                            minimum: 49,
                            maximum: 60,
                            interval: 1,
                          ),
                          series: <CartesianSeries>[
                            ScatterSeries<ChartSampleData, int>(
                              color: Colors.blue,
                              dataSource: chartData1,
                              xValueMapper: (ChartSampleData sales, _) => sales.x,
                              yValueMapper: (ChartSampleData sales, _) => sales.y,
                              markerSettings: MarkerSettings(
                                  isVisible: true,
                                  shape: DataMarkerType.image,
                                  image: AssetImage('images/ball.png')
                              ),
                            ),
                          ],
                        )
                      ]
                  )
              ),
            ),
//            Container(
//              height: 100,
//              child: Center(
//                  child: Stack(
//                      children: [
//                        getTrackerBarChart(false),
//                        SfCartesianChart(
//                          plotAreaBorderWidth: 0,
//                          primaryYAxis: NumericAxis(
//                              isVisible: false,
//                              majorGridLines: MajorGridLines(width: 0),
//                              minimum: 0,
//                              maximum: 1
//                          ),
//                          primaryXAxis: NumericAxis(
//                            majorGridLines: MajorGridLines(width: 0),
//                            majorTickLines: MajorTickLines(size: 0),
//                            minimum: 49,
//                            maximum: 60,
//                            interval: 1,
//                          ),
//                          series: <CartesianSeries>[
//                            ScatterSeries<ChartSampleData, int>(
//                              color: Colors.blue,
//                              dataSource: chartData1,
//                              xValueMapper: (ChartSampleData sales, _) => sales.x,
//                              yValueMapper: (ChartSampleData sales, _) => sales.y,
//                              markerSettings: MarkerSettings(
//                                  isVisible: true,
//                                  shape: DataMarkerType.image,
//                                  image: AssetImage('images/ball.png')
//                              ),
//                            ),
//                          ],
//                        )
//                      ]
//                  )
//              ),
//            ),
          ],
        )
    );
  }

}

SfCartesianChart getTrackerBarChart(bool isTileView) {
  return SfCartesianChart(
    plotAreaBorderWidth: 0,
    primaryXAxis: NumericAxis(
      isVisible: true,
      majorGridLines: MajorGridLines(width: 0),
      minimum: 0,
      maximum: 1
    ),
    primaryYAxis: NumericAxis(
        majorGridLines: MajorGridLines(width: 0),
        minimum: 49,
        maximum: 60,
        interval: 1,
        majorTickLines: MajorTickLines(size: 0),
    ),
      series: getStackedBarSeries(false)
  );
}

List<StackedBarSeries<ChartSampleData, int>> getStackedBarSeries(
    bool isTileView) {
  final List<ChartSampleData> chartData = <ChartSampleData>[
    ChartSampleData(x: 0, y: 52, yValue: 55)
  ];
  return <StackedBarSeries<ChartSampleData, int>>[
    StackedBarSeries<ChartSampleData, int>(
      enableTooltip: true,
      dataSource: chartData,
      color: Colors.transparent,
//      opacity: 0,
      borderColor: Colors.grey,
      borderWidth: 1,
      width: 0.7,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.y,
    ),
    StackedBarSeries<ChartSampleData, int>(
      enableTooltip: true,
      dataSource: chartData,
      width: 0.7,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
    ),
  ];
}

var chartData = [
  ChartSampleData(x: 0, y: 52, yValue: 55)
];

var chartData1 = [
  ChartSampleData(x: 52, y: 0.5),
];

class ChartSampleData {
  ChartSampleData(
      {this.x,
        this.y,
        this.xValue,
        this.yValue,
        this.yValue2,
        this.yValue3,
        this.pointColor,
        this.size,
        this.text});
  final dynamic x;
  final num y;
  final dynamic xValue;
  final num yValue;
  final num yValue2;
  final num yValue3;
  final Color pointColor;
  final num size;
  final String text;
}