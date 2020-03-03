import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WonderWeekData {
  WonderWeekData({
    this.x,
    this.y,
    this.xValue,
    this.yValue,
    this.yValue2,
    this.yValue3,
    this.yValue4,
    this.yValue5,
    this.yValue6,
    this.yValue7,
    this.yValue8,
    this.yValue9,
  });
  final dynamic x;
  final num y;
  final dynamic xValue;
  final num yValue;
  final num yValue2;
  final num yValue3;
  final num yValue4;
  final num yValue5;
  final num yValue6;
  final num yValue7;
  final num yValue8;
  final num yValue9;
}

var week7data = [
  WonderWeekData(
    x: 0,
    yValue: 1,
    yValue2: 2,
//    yValue3: 3,
//    yValue4: 4,
//    yValue5: 4.5,
//    yValue6: 5,
//    yValue7: 5.5,
//    yValue8: 6,
//    yValue9: 7
  )
];

var markerWeek7Data = [
  WonderWeekData(x: 5, y: 0.5),
];

Widget _buildWeek7() {
  return Container(
    height: 100,
    margin: EdgeInsets.only(right: 20),
    child: Center(
        child: Stack(
            children: [
              getTrackerBarWeek7(),
              SfCartesianChart(
                plotAreaBorderWidth: 0,
                primaryYAxis: NumericAxis(
                    isVisible: false,
                    majorGridLines: MajorGridLines(width: 0),
                    minimum: 0,
                    maximum: 1
                ),
                primaryXAxis: NumericAxis(
                  majorGridLines: MajorGridLines(width: 0),
                  majorTickLines: MajorTickLines(size: 0),
                  minimum: 0,
                  maximum: 7,
                  interval: 1,
                ),
                series: <CartesianSeries>[
                  ScatterSeries<WonderWeekData, int>(
                    color: Colors.blue,
                    dataSource: markerWeek7Data,
                    xValueMapper: (WonderWeekData sales, _) => sales.x,
                    yValueMapper: (WonderWeekData sales, _) => sales.y,
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
  );

}

SfCartesianChart getTrackerBarWeek7() {
  return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: NumericAxis(
          isVisible: false,
          majorGridLines: MajorGridLines(width: 0),
          minimum: 0,
          maximum: 1
      ),
      primaryYAxis: NumericAxis(
        majorGridLines: MajorGridLines(width: 0),
        majorTickLines: MajorTickLines(size: 0),
        minimum: 0,
        maximum: 7,
        interval: 1,
      ),
      series: getStackedBarSeriesWeek7()
  );
}

List<StackedBarSeries<WonderWeekData, int>> getStackedBarSeriesWeek7() {
  return <StackedBarSeries<WonderWeekData, int>>[
    StackedBarSeries<WonderWeekData, int>(
      enableTooltip: true,
      dataSource: week7data,
      color: Colors.grey,
      width: 0.7,
      xValueMapper: (WonderWeekData sales, _) => sales.x,
      yValueMapper: (WonderWeekData sales, _) => sales.y,
    ),
    StackedBarSeries<WonderWeekData, int>(
      enableTooltip: true,
      dataSource: week7data,
      width: 0.7,
      xValueMapper: (WonderWeekData sales, _) => sales.x,
      yValueMapper: (WonderWeekData sales, _) => sales.yValue,
    ),
  ];
}
