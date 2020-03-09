import 'package:baby_index_module/build_wonderweek.dart';
import 'package:baby_index_module/data_chart_wonderweek.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: ListView(
        children: [
          Container(
            width: w,
            height: 1100,
            child: Stack(
              children: [
                getTrackerBarChart(),
                SfCartesianChart(
//                  margin: EdgeInsets.only(left: 20),
                  plotAreaBorderWidth: 0,
                  primaryYAxis: NumericAxis(
                    opposedPosition: true,
                    isInversed: true,
                    isVisible: true,
                    majorGridLines: MajorGridLines(width: 0),
                    minimum: -1,
                    maximum: 13,
                    interval: 1,
                  ),
                  primaryXAxis: NumericAxis(
                    isVisible: true,
                    majorGridLines: MajorGridLines(width: 0),
                    minimum: -1,
                    maximum: 8,
                    interval: 1,
                    majorTickLines: MajorTickLines(size: 0),
                  ),
                  series: <CartesianSeries>[
                    ScatterSeries<WonderWeekData, double>(
                        isVisible: true,
                        opacity: 0,
                        dataSource: [WonderWeekData(x: 2.0, y:3)],
                        xValueMapper: (WonderWeekData sales, _) => sales.x,
                        yValueMapper: (WonderWeekData sales, _) => sales.y,
                        dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            builder: (dynamic data,
                                dynamic point,
                                dynamic series,
                                int pointIndex,
                                int seriesIndex) {
                              return Text('$seriesIndex');
                            })
                    ),
                    ScatterSeries<WonderWeekData, double>(
                        isVisible: true,
                        opacity: 0,
                        dataSource: data2,
                        xValueMapper: (WonderWeekData sales, _) => sales.x,
                        yValueMapper: (WonderWeekData sales, _) => sales.yValue,
                        dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            builder: (dynamic data,
                                dynamic point,
                                dynamic series,
                                int pointIndex,
                                int seriesIndex) {
                              return Text('$seriesIndex');
                            })
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

SfCartesianChart getTrackerBarChart() {
  return SfCartesianChart(
//      margin: EdgeInsets.only(left: 20),
      plotAreaBorderWidth: 0,
      primaryXAxis: NumericAxis(
        opposedPosition: true,
        isInversed: true,
        isVisible: true,
        majorGridLines: MajorGridLines(width: 0),
        minimum: -1,
        maximum: 13,
        interval: 1,
      ),
      primaryYAxis: NumericAxis(
        isVisible: true,
        majorGridLines: MajorGridLines(width: 0),
        minimum: -1,
        maximum: 8,
        interval: 1,
        majorTickLines: MajorTickLines(size: 0),
      ),
      series: getStackedBarSeries());
}

List<StackedBarSeries<WonderWeekData, int>> getStackedBarSeries() {
  return <StackedBarSeries<WonderWeekData, int>>[
    StackedBarSeries<WonderWeekData, int>(
      enableTooltip: true,
      dataSource: data1,
      color: Colors.transparent,
      borderColor: Colors.grey,
      borderWidth: 1,
      width: 0.26,
      xValueMapper: (WonderWeekData sales, _) => sales.x,
      yValueMapper: (WonderWeekData sales, _) => sales.y,
    ),
    StackedBarSeries<WonderWeekData, int>(
      enableTooltip: true,
      dataSource: data1,
      color: colorGrumpy,
      borderColor: Colors.grey,
      borderWidth: 1,
      width: 0.26,
      xValueMapper: (WonderWeekData sales, _) => sales.x,
      yValueMapper: (WonderWeekData sales, _) => sales.yValue,
    ),
    StackedBarSeries<WonderWeekData, int>(
      enableTooltip: true,
      dataSource: data1,
      color: Colors.transparent,
      borderColor: Colors.grey,
      borderWidth: 1,
      width: 0.26,
      xValueMapper: (WonderWeekData sales, _) => sales.x,
      yValueMapper: (WonderWeekData sales, _) => sales.yValue2,
    ),
    StackedBarSeries<WonderWeekData, int>(
      enableTooltip: true,
      dataSource: data1,
      color: Colors.transparent,
      borderColor: Colors.grey,
      borderWidth: 1,
      width: 0.26,
      xValueMapper: (WonderWeekData sales, _) => sales.x,
      yValueMapper: (WonderWeekData sales, _) => sales.yValue3,
    ),
    StackedBarSeries<WonderWeekData, int>(
      enableTooltip: true,
      dataSource: data1,
      color: Colors.transparent,
      borderColor: Colors.grey,
      borderWidth: 1,
      width: 0.26,
      xValueMapper: (WonderWeekData sales, _) => sales.x,
      yValueMapper: (WonderWeekData sales, _) => sales.yValue4,
    ),
    StackedBarSeries<WonderWeekData, int>(
      enableTooltip: true,
      dataSource: data1,
      color: Colors.transparent,
      borderColor: Colors.grey,
      borderWidth: 1,
      width: 0.26,
      xValueMapper: (WonderWeekData sales, _) => sales.x,
      yValueMapper: (WonderWeekData sales, _) => sales.yValue5,
    ),
    StackedBarSeries<WonderWeekData, int>(
      enableTooltip: true,
      dataSource: data1,
      color: Colors.transparent,
      borderColor: Colors.grey,
      borderWidth: 1,
      width: 0.26,
      xValueMapper: (WonderWeekData sales, _) => sales.x,
      yValueMapper: (WonderWeekData sales, _) => sales.yValue6,
    ),
    StackedBarSeries<WonderWeekData, int>(
      enableTooltip: true,
      dataSource: data1,
      color: Colors.transparent,
      borderColor: Colors.grey,
      borderWidth: 1,
      width: 0.26,
      xValueMapper: (WonderWeekData sales, _) => sales.x,
      yValueMapper: (WonderWeekData sales, _) => sales.yValue7,
    ),
  ];
}

var data1 = [
  WonderWeekData(
    x: 0,
    y: 1,
    yValue: 0.5,
    yValue2: 0.5,
    yValue3: 1,
    yValue4: 1,
    yValue5: 1,
    yValue6: 1,
    yValue7: 1,
//    yValue8: 1,
  ),
//  WonderWeekData(
//    x: 1,
//    y: 1,
//    yValue: 1,
//    yValue2: 1,
//    yValue3: 1,
//    yValue4: 0.5,
//    yValue5: 0.5,
//    yValue6: 0.5,
//    yValue7: 0.5,
//    yValue8: 1,
//  )
];


var data2 = [
  WonderWeekData(
    x: 0.0,
    y: 0.25,
    yValue: 1.25
  ),

  WonderWeekData(
      x: 1.0,
      y: 0.25,
      yValue: 1.25
  )
];
