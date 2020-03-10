
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'data_chart_wonderweek.dart';

final double widthBorderChart = 1;
final double heightMarkerBaby = 15;
final double widthMarkerBaby = 12;
final double widthItemChart = 0.26;

final Color colorBorder = Colors.grey[400];
final Color colorGrumpy = Colors.grey[350];
final Color colorPettish = Colors.pink[50];

class BuildWonderWeek extends StatefulWidget {
  /*final List<WonderWeekData> markerBaby;

  BuildChartWonderWeek({Key key, this.markerBaby}) : super(key: key);*/

  @override
  _BuildWonderWeekState createState() => _BuildWonderWeekState();
}

class _BuildWonderWeekState extends State<BuildWonderWeek> {

  _BuildWonderWeekState();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1100,
      margin: EdgeInsets.only(left: 15, right: 10),
      child: Stack(
        children: [
          getTrackerBarChart(),
          SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryYAxis: NumericAxis(
              opposedPosition: false,
              isInversed: true,
              isVisible: true,
              majorGridLines: MajorGridLines(width: 0),
              minimum: -0.4,
              maximum: 13,
              interval: 1,
            ),
            primaryXAxis: NumericAxis(
              isVisible: true,
              majorGridLines: MajorGridLines(width: 0),
              minimum: -0.1,
              maximum: 7.1,
              interval: 1,
              majorTickLines: MajorTickLines(size: 0),
            ),
            series: <CartesianSeries>[

            ],
          ),
        ],
      ),
    );
  }
}

SfCartesianChart getTrackerBarChart() {
  return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: NumericAxis(
        opposedPosition: false,
        isInversed: true,
        isVisible: true,
        majorGridLines: MajorGridLines(width: 0),
        minimum: -0.4,
        maximum: 13,
        interval: 1,
      ),
      primaryYAxis: NumericAxis(
        isVisible: true,
        majorGridLines: MajorGridLines(width: 0),
        minimum: -0.1,
        maximum: 7.1,
        interval: 1,
        majorTickLines: MajorTickLines(size: 0),
      ),
//      series: getStackedBarSeries());
      series: <StackedBarSeries>[
        StackedBarSeries<WonderWeekData, int>(
          enableTooltip: true,
          dataSource: week7data,
          color: Colors.transparent,
          borderColor: Colors.grey,
          borderWidth: widthBorderChart,
          width: widthItemChart,
          xValueMapper: (WonderWeekData sales, _) => sales.x,
          yValueMapper: (WonderWeekData sales, _) => sales.y,
        ),
//        StackedBarSeries<WonderWeekData, int>(
//          dataSource: week14data,
//          color: Colors.transparent,
//          borderColor: colorBorder,
//          borderWidth: widthBorderChart,
//          width: widthItemChart,
//          xValueMapper: (WonderWeekData sales, _) => sales.x,
//          yValueMapper: (WonderWeekData sales, _) => sales.y,
//        ),
      ]
  );
}

List<StackedBarSeries<WonderWeekData, int>> getStackedBarSeries() {
  return <StackedBarSeries<WonderWeekData, int>>[
    /*
      Build week 7
    * */
    StackedBarSeries<WonderWeekData, int>(
      enableTooltip: true,
      dataSource: week7data,
      color: Colors.transparent,
      borderColor: Colors.grey,
      borderWidth: widthBorderChart,
      width: widthItemChart,
      xValueMapper: (WonderWeekData sales, _) => sales.x,
      yValueMapper: (WonderWeekData sales, _) => sales.y,
    ),
//    StackedBarSeries<WonderWeekData, int>(
//      enableTooltip: true,
//      dataSource: week7data,
//      color: Colors.transparent,
//      borderColor: Colors.grey,
//      borderWidth: widthBorderChart,
//      width: widthItemChart,
//      xValueMapper: (WonderWeekData sales, _) => sales.x,
//      yValueMapper: (WonderWeekData sales, _) => sales.yValue,
//    ),
//    StackedBarSeries<WonderWeekData, int>(
//      enableTooltip: true,
//      dataSource: week7data,
//      color: Colors.transparent,
//      borderColor: Colors.grey,
//      borderWidth: widthBorderChart,
//      width: widthItemChart,
//      xValueMapper: (WonderWeekData sales, _) => sales.x,
//      yValueMapper: (WonderWeekData sales, _) => sales.yValue2,
//    ),
//    StackedBarSeries<WonderWeekData, int>(
//      enableTooltip: true,
//      dataSource: week7data,
//      color: Colors.transparent,
//      borderColor: Colors.grey,
//      borderWidth: widthBorderChart,
//      width: widthItemChart,
//      xValueMapper: (WonderWeekData sales, _) => sales.x,
//      yValueMapper: (WonderWeekData sales, _) => sales.yValue3,
//    ),
//    StackedBarSeries<WonderWeekData, int>(
//      enableTooltip: true,
//      dataSource: week7data,
//      color: Colors.transparent,
//      borderColor: Colors.grey,
//      borderWidth: widthBorderChart,
//      width: widthItemChart,
//      xValueMapper: (WonderWeekData sales, _) => sales.x,
//      yValueMapper: (WonderWeekData sales, _) => sales.yValue4,
//    ),
//    StackedBarSeries<WonderWeekData, int>(
//      enableTooltip: true,
//      dataSource: week7data,
//      color: colorGrumpy,
//      borderColor: Colors.grey,
//      borderWidth: widthBorderChart,
//      width: widthItemChart,
//      xValueMapper: (WonderWeekData sales, _) => sales.x,
//      yValueMapper: (WonderWeekData sales, _) => sales.yValue5,
//    ),
//    StackedBarSeries<WonderWeekData, int>(
//      enableTooltip: true,
//      dataSource: week7data,
//      color: colorGrumpy,
//      borderColor: Colors.grey,
//      borderWidth: widthBorderChart,
//      width: widthItemChart,
//      xValueMapper: (WonderWeekData sales, _) => sales.x,
//      yValueMapper: (WonderWeekData sales, _) => sales.yValue6,
//    ),
//    StackedBarSeries<WonderWeekData, int>(
//      enableTooltip: true,
//      dataSource: week7data,
//      color: Colors.transparent,
//      borderColor: Colors.grey,
//      borderWidth: widthBorderChart,
//      width: widthItemChart,
//      xValueMapper: (WonderWeekData sales, _) => sales.x,
//      yValueMapper: (WonderWeekData sales, _) => sales.yValue7,
//    ),
//    StackedBarSeries<WonderWeekData, int>(
//      enableTooltip: true,
//      dataSource: week7data,
//      color: Colors.transparent,
//      borderColor: Colors.grey,
//      borderWidth: widthBorderChart,
//      width: widthItemChart,
//      xValueMapper: (WonderWeekData sales, _) => sales.x,
//      yValueMapper: (WonderWeekData sales, _) => sales.yValue8,
//    ),
    /*
      Build week 14
    * */
//    StackedBarSeries<WonderWeekData, int>(
//      dataSource: week14data,
//      color: Colors.transparent,
//      borderColor: colorBorder,
//      borderWidth: widthBorderChart,
//      width: widthItemChart,
//      xValueMapper: (WonderWeekData sales, _) => sales.x,
//      yValueMapper: (WonderWeekData sales, _) => sales.y,
//    ),
//    StackedBarSeries<WonderWeekData, int>(
//      dataSource: week14data,
//      color: colorGrumpy,
//      borderColor: colorBorder,
//      borderWidth: widthBorderChart,
//      width: widthItemChart,
//      xValueMapper: (WonderWeekData sales, _) => sales.x,
//      yValueMapper: (WonderWeekData sales, _) => sales.yValue,
//    ),
//    StackedBarSeries<WonderWeekData, int>(
//      dataSource: week14data,
//      color: colorGrumpy,
//      borderColor: colorBorder,
//      borderWidth: widthBorderChart,
//      width: widthItemChart,
//      xValueMapper: (WonderWeekData sales, _) => sales.x,
//      yValueMapper: (WonderWeekData sales, _) => sales.yValue2,
//    ),
//    StackedBarSeries<WonderWeekData, int>(
//      dataSource: week14data,
//      color: colorGrumpy,
//      borderColor: colorBorder,
//      borderWidth: widthBorderChart,
//      width: widthItemChart,
//      xValueMapper: (WonderWeekData sales, _) => sales.x,
//      yValueMapper: (WonderWeekData sales, _) => sales.yValue3,
//    ),
//    StackedBarSeries<WonderWeekData, int>(
//      dataSource: week14data,
//      color: Colors.transparent,
//      borderColor: colorBorder,
//      borderWidth: widthBorderChart,
//      width: widthItemChart,
//      xValueMapper: (WonderWeekData sales, _) => sales.x,
//      yValueMapper: (WonderWeekData sales, _) => sales.yValue4,
//    ),
//    StackedBarSeries<WonderWeekData, int>(
//      dataSource: week14data,
//      color: Colors.transparent,
//      borderColor: colorBorder,
//      borderWidth: widthBorderChart,
//      width: widthItemChart,
//      xValueMapper: (WonderWeekData sales, _) => sales.x,
//      yValueMapper: (WonderWeekData sales, _) => sales.yValue5,
//    ),
//    StackedBarSeries<WonderWeekData, int>(
//      dataSource: week14data,
//      color: Colors.transparent,
//      borderColor: colorBorder,
//      borderWidth: widthBorderChart,
//      width: widthItemChart,
//      xValueMapper: (WonderWeekData sales, _) => sales.x,
//      yValueMapper: (WonderWeekData sales, _) => sales.yValue6,
//    ),
//    StackedBarSeries<WonderWeekData, int>(
//      dataSource: week14data,
//      color: colorGrumpy,
//      borderColor: colorBorder,
//      borderWidth: widthBorderChart,
//      width: widthItemChart,
//      xValueMapper: (WonderWeekData sales, _) => sales.x,
//      yValueMapper: (WonderWeekData sales, _) => sales.yValue7,
//    ),
//    StackedBarSeries<WonderWeekData, int>(
//      dataSource: week14data,
//      color: colorGrumpy,
//      borderColor: colorBorder,
//      borderWidth: widthBorderChart,
//      width: widthItemChart,
//      xValueMapper: (WonderWeekData sales, _) => sales.x,
//      yValueMapper: (WonderWeekData sales, _) => sales.yValue8,
//    ),
//    StackedBarSeries<WonderWeekData, int>(
//      dataSource: week14data,
//      color: Colors.transparent,
//      borderColor: colorBorder,
//      borderWidth: widthBorderChart,
//      width: widthItemChart,
//      xValueMapper: (WonderWeekData sales, _) => sales.x,
//      yValueMapper: (WonderWeekData sales, _) => sales.yValue9,
//    ),
//    StackedBarSeries<WonderWeekData, int>(
//      dataSource: week14data,
//      color: Colors.transparent,
//      borderColor: colorBorder,
//      borderWidth: widthBorderChart,
//      width: widthItemChart,
//      xValueMapper: (WonderWeekData sales, _) => sales.x,
//      yValueMapper: (WonderWeekData sales, _) => sales.yValue10,
//    ),
  ];
}

var data3 = [
  WonderWeekData(
    x: 0.0,
    y: -0.3,
  ),
];
