
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
    return Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 10),
//          child: getTrackerBarChart(false),
          child: SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryYAxis: NumericAxis(
              isVisible: true,
              majorGridLines: MajorGridLines(width: 0),
              minimum: -1,
              maximum: 12,
              interval: 1,
            ),
            primaryXAxis: NumericAxis(
              isVisible: true,
              majorGridLines: MajorGridLines(width: 0),
              minimum: 0,
              maximum: 7,
              interval: 1,
              majorTickLines: MajorTickLines(size: 0),
            ),
            series: <ChartSeries>[
              ScatterSeries<WonderWeekData, int>(
                isVisible: true,
                opacity: 0,
                dataSource: data2,
                xValueMapper: (WonderWeekData sales, _) => sales.x,
                yValueMapper: (WonderWeekData sales, _) => sales.y,
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
                    return Text('point.x');
                  }
                )
              )
            ],
          ),
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
          maximum: 12,
          interval: 1,
      ),
      primaryYAxis: NumericAxis(
        isVisible: true,
        majorGridLines: MajorGridLines(width: 0),
        minimum: 0,
        maximum: 7,
        interval: 1,
        majorTickLines: MajorTickLines(size: 0),
      ),
      series: getStackedBarSeries(false)
  );
}

List<StackedBarSeries<WonderWeekData, int>> getStackedBarSeries(
    bool isTileView) {
  return <StackedBarSeries<WonderWeekData, int>>[
    StackedBarSeries<WonderWeekData, int>(
      enableTooltip: true,
      dataSource: data1,
      color: Colors.transparent,
      borderColor: Colors.grey,
      borderWidth: 1,
      width: 0.5,
      xValueMapper: (WonderWeekData sales, _) => sales.x,
      yValueMapper: (WonderWeekData sales, _) => sales.y,
    ),
  ];
}


var data1 = [
  WonderWeekData(
    x: 0,
    y: 1,
    yValue: 1,
    yValue2: 1,
    yValue3: 1,
    yValue4: 0.5,
    yValue5: 0.5,
    yValue6: 0.5,
    yValue7: 0.5,
    yValue8: 1,
  )
];

var data2 = [
  WonderWeekData(
    x: 2,
    y: 7,
  )
];