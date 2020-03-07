import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'data_chart_wonderweek.dart';

final double widthBorderChart = 1;
final double heightWonderWeekChart = 0.7;
final double heightMarkerBaby = 15;
final double widthMarkerBaby = 12;

final Color colorBorder = Colors.grey[400];
final Color colorGrumpy = Colors.grey[350];
final Color colorPettish = Colors.pink[50];

class BuildChartWonderWeek7 extends StatelessWidget {
  final List<WonderWeekData> markerBaby;

  BuildChartWonderWeek7({Key key, this.markerBaby}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 15, right: 15),
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
                    isVisible: false,
                    majorGridLines: MajorGridLines(width: 0),
                    majorTickLines: MajorTickLines(size: 0),
                    minimum: 0,
                    maximum: 7,
                    interval: 1,
                  ),
                  series: <CartesianSeries>[
                    ScatterSeries<WonderWeekData, int>(
                      dataSource: markerWeek7DataRain,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                        height: 11,
                        width: 11,
                        isVisible: true,
                        shape: DataMarkerType.image,
                        image: AssetImage('images/cloud.png')
                      ),
                    ),
                    ScatterSeries<WonderWeekData, int>(
                      dataSource: markerWeek7DataDocile,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: 11,
                          width: 11,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/sunny.png')
                      ),
                    ),
                    ScatterSeries<WonderWeekData, double>(
                      dataSource: markerBaby,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: heightMarkerBaby,
                          width: widthMarkerBaby,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/baby.png')
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
          axisLine: AxisLine(width: widthBorderChart, color: colorBorder),
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
        dataSource: week7data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.y,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week7data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week7data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue2,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week7data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue3,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week7data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue4,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week7data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue5,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week7data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
          yValueMapper: (WonderWeekData sales, _) => sales.yValue6,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week7data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue7,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week7data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue8,
      ),
    ];
  }
}

class BuildChartWonderWeek14 extends StatelessWidget {
  final List<WonderWeekData> markerBaby;

  BuildChartWonderWeek14({Key key, this.markerBaby}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Center(
          child: Stack(
              children: [
                getTrackerBarWeek14(),
                SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  primaryYAxis: NumericAxis(
                      isVisible: false,
                      majorGridLines: MajorGridLines(width: 0),
                      minimum: 0,
                      maximum: 1
                  ),
                  primaryXAxis: NumericAxis(
                    isVisible: false,
                    majorGridLines: MajorGridLines(width: 0),
                    majorTickLines: MajorTickLines(size: 0),
                    minimum: 7,
                    maximum: 14,
                    interval: 1,
                  ),
                  series: <CartesianSeries>[
                    ScatterSeries<WonderWeekData, int>(
                      dataSource: markerWeek14DataRain,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: 11,
                          width: 11,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/cloud.png')
                      ),
                    ),
                    ScatterSeries<WonderWeekData, int>(
                      dataSource: markerWeek14DataDocile,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: 11,
                          width: 11,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/sunny.png')
                      ),
                    ),
                    ScatterSeries<WonderWeekData, double>(
                      dataSource: markerBaby,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: heightMarkerBaby,
                          width: widthMarkerBaby,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/baby.png')
                      ),
                    ),
                  ],
                )
              ]
          )
      ),
    );
  }

  SfCartesianChart getTrackerBarWeek14() {
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
          axisLine: AxisLine(width: widthBorderChart, color: colorBorder),
          minimum: 7,
          maximum: 14,
          interval: 1,
        ),
        series: getStackedBarSeriesWeek14()
    );
  }

  List<StackedBarSeries<WonderWeekData, int>> getStackedBarSeriesWeek14() {
    return <StackedBarSeries<WonderWeekData, int>>[
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week14data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.y,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week14data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week14data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue2,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week14data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue3,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week14data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue4,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week14data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue5,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week14data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue6,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week14data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue7,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week14data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue8,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week14data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue9,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week14data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue10,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week14data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue11,
      ),
    ];
  }
}

class BuildChartWonderWeek21 extends StatelessWidget {
  final List<WonderWeekData> markerBaby;

  BuildChartWonderWeek21({Key key, this.markerBaby}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Center(
          child: Stack(
              children: [
                getTrackerBarWeek21(),
                SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  primaryYAxis: NumericAxis(
                      isVisible: false,
                      majorGridLines: MajorGridLines(width: 0),
                      minimum: 0,
                      maximum: 1
                  ),
                  primaryXAxis: NumericAxis(
                    isVisible: false,
                    majorGridLines: MajorGridLines(width: 0),
                    majorTickLines: MajorTickLines(size: 0),
                    minimum: 14,
                    maximum: 21,
                    interval: 1,
                  ),
                  series: <CartesianSeries>[
                    ScatterSeries<WonderWeekData, int>(
                      dataSource: markerWeek21DataRain,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: 11,
                          width: 11,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/cloud.png')
                      ),
                    ),
                    ScatterSeries<WonderWeekData, int>(
                      dataSource: markerWeek21DataDocile,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: 11,
                          width: 11,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/sunny.png')
                      ),
                    ),
                    ScatterSeries<WonderWeekData, double>(
                      dataSource: markerBaby,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: heightMarkerBaby,
                          width: widthMarkerBaby,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/baby.png')
                      ),
                    ),
                  ],
                )
              ]
          )
      ),
    );
  }

  SfCartesianChart getTrackerBarWeek21() {
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
          axisLine: AxisLine(width: widthBorderChart, color: colorBorder),
          minimum: 14,
          maximum: 21,
          interval: 1,
        ),
        series: getStackedBarSeriesWeek21()
    );
  }

  List<StackedBarSeries<WonderWeekData, int>> getStackedBarSeriesWeek21() {
    return <StackedBarSeries<WonderWeekData, int>>[
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week21data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.y,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week21data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week21data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue2,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week21data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue3,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week21data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue4,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week21data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue5,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week21data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue6,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week21data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue7,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week21data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue8,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week21data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue9,
      ),
    ];
  }
}

class BuildChartWonderWeek28 extends StatelessWidget {
  final List<WonderWeekData> markerBaby;

  BuildChartWonderWeek28({Key key, this.markerBaby}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Center(
          child: Stack(
              children: [
                getTrackerBarWeek28(),
                SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  primaryYAxis: NumericAxis(
                      isVisible: false,
                      majorGridLines: MajorGridLines(width: 0),
                      minimum: 0,
                      maximum: 1
                  ),
                  primaryXAxis: NumericAxis(
                    isVisible: false,
                    majorGridLines: MajorGridLines(width: 0),
                    majorTickLines: MajorTickLines(size: 0),
                    minimum: 21,
                    maximum: 28,
                    interval: 1,
                  ),
                  series: <CartesianSeries>[
                    ScatterSeries<WonderWeekData, int>(
                      dataSource: markerWeek28DataRain,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: 11,
                          width: 11,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/cloud.png')
                      ),
                    ),
                    ScatterSeries<WonderWeekData, int>(
                      dataSource: markerWeek28DataDocile,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: 11,
                          width: 11,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/sunny.png')
                      ),
                    ),
                    ScatterSeries<WonderWeekData, double>(
                      dataSource: markerBaby,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: heightMarkerBaby,
                          width: widthMarkerBaby,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/baby.png')
                      ),
                    ),
                  ],
                )
              ]
          )
      ),
    );
  }

  SfCartesianChart getTrackerBarWeek28() {
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
          axisLine: AxisLine(width: widthBorderChart, color: colorBorder),
          minimum: 21,
          maximum: 28,
          interval: 1,
        ),
        series: getStackedBarSeriesWeek28()
    );
  }

  List<StackedBarSeries<WonderWeekData, int>> getStackedBarSeriesWeek28() {
    return <StackedBarSeries<WonderWeekData, int>>[
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week28data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.y,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week28data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week28data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue2,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week28data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue3,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week28data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue4,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week28data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue5,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week28data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue6,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week21data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue7,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week28data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue8,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week28data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue9,
      ),
    ];
  }
}

class BuildChartWonderWeek35 extends StatelessWidget {
  final List<WonderWeekData> markerBaby;

  BuildChartWonderWeek35({Key key, this.markerBaby}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Center(
          child: Stack(
              children: [
                getTrackerBarWeek35(),
                SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  primaryYAxis: NumericAxis(
                      isVisible: false,
                      majorGridLines: MajorGridLines(width: 0),
                      minimum: 0,
                      maximum: 1
                  ),
                  primaryXAxis: NumericAxis(
                    isVisible: false,
                    majorGridLines: MajorGridLines(width: 0),
                    majorTickLines: MajorTickLines(size: 0),
                    minimum: 28,
                    maximum: 35,
                    interval: 1,
                  ),
                  series: <CartesianSeries>[
                    ScatterSeries<WonderWeekData, int>(
                      dataSource: markerWeek35DataDocile,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: 11,
                          width: 11,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/sunny.png')
                      ),
                    ),
                    ScatterSeries<WonderWeekData, double>(
                      dataSource: markerBaby,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: heightMarkerBaby,
                          width: widthMarkerBaby,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/baby.png')
                      ),
                    ),
                  ],
                )
              ]
          )
      ),
    );
  }

  SfCartesianChart getTrackerBarWeek35() {
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
          axisLine: AxisLine(width: widthBorderChart, color: colorBorder),
          minimum: 28,
          maximum: 35,
          interval: 1,
        ),
        series: getStackedBarSeriesWeek35()
    );
  }

  List<StackedBarSeries<WonderWeekData, int>> getStackedBarSeriesWeek35() {
    return <StackedBarSeries<WonderWeekData, int>>[
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week35data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.y,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week35data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week35data,
        color: colorPettish,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue2,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week35data,
        color: colorPettish,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue3,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week35data,
        color: colorPettish,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue4,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week35data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue5,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week35data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue6,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week35data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue7,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week35data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue8,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week35data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue9,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week35data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue10,
      ),
    ];
  }
}

class BuildChartWonderWeek42 extends StatelessWidget {
  final List<WonderWeekData> markerBaby;

  BuildChartWonderWeek42({Key key, this.markerBaby}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Center(
          child: Stack(
              children: [
                getTrackerBarWeek42(),
                SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  primaryYAxis: NumericAxis(
                      isVisible: false,
                      majorGridLines: MajorGridLines(width: 0),
                      minimum: 0,
                      maximum: 1
                  ),
                  primaryXAxis: NumericAxis(
                    isVisible: false,
                    majorGridLines: MajorGridLines(width: 0),
                    majorTickLines: MajorTickLines(size: 0),
                    minimum: 35,
                    maximum: 42,
                    interval: 1,
                  ),
                  series: <CartesianSeries>[
                    ScatterSeries<WonderWeekData, int>(
                      dataSource: markerWeek42DataRain,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: 11,
                          width: 11,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/cloud.png')
                      ),
                    ),
                    ScatterSeries<WonderWeekData, int>(
                      dataSource: markerWeek42DataDocile,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: 11,
                          width: 11,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/sunny.png')
                      ),
                    ),
                    ScatterSeries<WonderWeekData, double>(
                      dataSource: markerBaby,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: heightMarkerBaby,
                          width: widthMarkerBaby,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/baby.png')
                      ),
                    ),
                  ],
                )
              ]
          )
      ),
    );
  }

  SfCartesianChart getTrackerBarWeek42() {
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
          axisLine: AxisLine(width: widthBorderChart, color: colorBorder),
          minimum: 35,
          maximum: 42,
          interval: 1,
        ),
        series: getStackedBarSeriesWeek42()
    );
  }

  List<StackedBarSeries<WonderWeekData, int>> getStackedBarSeriesWeek42() {
    return <StackedBarSeries<WonderWeekData, int>>[
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week42data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.y,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week42data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week42data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue2,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week42data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue3,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week42data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue4,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week42data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue5,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week42data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue6,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week42data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue7,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week42data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue8,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week42data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue9,
      ),
    ];
  }
}

class BuildChartWonderWeek49 extends StatelessWidget {
  final List<WonderWeekData> markerBaby;

  BuildChartWonderWeek49({Key key, this.markerBaby}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Center(
          child: Stack(
              children: [
                getTrackerBarWeek49(),
                SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  primaryYAxis: NumericAxis(
                      isVisible: false,
                      majorGridLines: MajorGridLines(width: 0),
                      minimum: 0,
                      maximum: 1
                  ),
                  primaryXAxis: NumericAxis(
                    isVisible: false,
                    majorGridLines: MajorGridLines(width: 0),
                    majorTickLines: MajorTickLines(size: 0),
                    minimum: 42,
                    maximum: 49,
                    interval: 1,
                  ),
                  series: <CartesianSeries>[
                    ScatterSeries<WonderWeekData, int>(
                      dataSource: markerWeek49DataRain,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: 11,
                          width: 11,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/cloud.png')
                      ),
                    ),
                    ScatterSeries<WonderWeekData, int>(
                      dataSource: markerWeek49DataDocile,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: 11,
                          width: 11,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/sunny.png')
                      ),
                    ),
                    ScatterSeries<WonderWeekData, double>(
                      dataSource: markerBaby,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: heightMarkerBaby,
                          width: widthMarkerBaby,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/baby.png')
                      ),
                    ),
                  ],
                )
              ]
          )
      ),
    );
  }

  SfCartesianChart getTrackerBarWeek49() {
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
          axisLine: AxisLine(width: widthBorderChart, color: colorBorder),
          minimum: 42,
          maximum: 49,
          interval: 1,
        ),
        series: getStackedBarSeriesWeek49()
    );
  }

  List<StackedBarSeries<WonderWeekData, int>> getStackedBarSeriesWeek49() {
    return <StackedBarSeries<WonderWeekData, int>>[
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week49data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.y,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week49data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week49data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue2,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week49data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue3,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week49data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue4,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week49data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue5,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week49data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue6,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week49data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue7,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week49data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue8,
      ),
    ];
  }
}

class BuildChartWonderWeek56 extends StatelessWidget {

  final List<WonderWeekData> markerBaby;

  BuildChartWonderWeek56({Key key, this.markerBaby}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Center(
          child: Stack(
              children: [
                getTrackerBarWeek56(),
                SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  primaryYAxis: NumericAxis(
                      isVisible: false,
                      majorGridLines: MajorGridLines(width: 0),
                      minimum: 0,
                      maximum: 1
                  ),
                  primaryXAxis: NumericAxis(
                    isVisible: false,
                    majorGridLines: MajorGridLines(width: 0),
                    majorTickLines: MajorTickLines(size: 0),
                    minimum: 49,
                    maximum: 56,
                    interval: 1,
                  ),
                  series: <CartesianSeries>[
                    ScatterSeries<WonderWeekData, int>(
                      dataSource: markerWeek56DataRain,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: 11,
                          width: 11,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/cloud.png')
                      ),
                    ),
                    ScatterSeries<WonderWeekData, int>(
                      dataSource: markerWeek56DataDocile,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: 11,
                          width: 11,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/sunny.png')
                      ),
                    ),
                    ScatterSeries<WonderWeekData, double>(
                      dataSource: markerBaby,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: heightMarkerBaby,
                          width: widthMarkerBaby,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/baby.png')
                      ),
                    ),
                  ],
                )
              ]
          )
      ),
    );
  }

  SfCartesianChart getTrackerBarWeek56() {
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
          axisLine: AxisLine(width: widthBorderChart, color: colorBorder),
          minimum: 49,
          maximum: 56,
          interval: 1,
        ),
        series: getStackedBarSeriesWeek56()
    );
  }

  List<StackedBarSeries<WonderWeekData, int>> getStackedBarSeriesWeek56() {
    return <StackedBarSeries<WonderWeekData, int>>[
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week56data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.y,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week56data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week56data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue2,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week56data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue3,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week56data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue4,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week56data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue5,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week56data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue6,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week56data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue7,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week56data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue8,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week56data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue9,
      ),
    ];
  }
}

class BuildChartWonderWeek63 extends StatelessWidget {
  final List<WonderWeekData> markerBaby;

  BuildChartWonderWeek63({Key key, this.markerBaby}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Center(
          child: Stack(
              children: [
                getTrackerBarWeek63(),
                SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  primaryYAxis: NumericAxis(
                      isVisible: false,
                      majorGridLines: MajorGridLines(width: 0),
                      minimum: 0,
                      maximum: 1
                  ),
                  primaryXAxis: NumericAxis(
                    isVisible: false,
                    majorGridLines: MajorGridLines(width: 0),
                    majorTickLines: MajorTickLines(size: 0),
                    minimum: 56,
                    maximum: 63,
                    interval: 1,
                  ),
                  series: <CartesianSeries>[
                    ScatterSeries<WonderWeekData, double>(
                      dataSource: markerWeek63DataRain,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: 11,
                          width: 11,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/cloud.png')
                      ),
                    ),
                    ScatterSeries<WonderWeekData, int>(
                      dataSource: markerWeek63DataDocile,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: 11,
                          width: 11,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/sunny.png')
                      ),
                    ),
                    ScatterSeries<WonderWeekData, double>(
                      dataSource: markerBaby,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: heightMarkerBaby,
                          width: widthMarkerBaby,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/baby.png')
                      ),
                    ),
                  ],
                )
              ]
          )
      ),
    );
  }

  SfCartesianChart getTrackerBarWeek63() {
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
          axisLine: AxisLine(width: widthBorderChart, color: colorBorder),
          minimum: 56,
          maximum: 63,
          interval: 1,
        ),
        series: getStackedBarSeriesWeek63()
    );
  }

  List<StackedBarSeries<WonderWeekData, int>> getStackedBarSeriesWeek63() {
    return <StackedBarSeries<WonderWeekData, int>>[
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week63data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.y,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week63data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week63data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue2,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week63data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue3,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week63data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue4,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week63data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue5,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week63data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue6,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week63data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue7,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week63data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue8,
      ),
    ];
  }
}

class BuildChartWonderWeek70 extends StatelessWidget {
  final List<WonderWeekData> markerBaby;

  BuildChartWonderWeek70({Key key, this.markerBaby}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Center(
          child: Stack(
              children: [
                getTrackerBarWeek70(),
                SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  primaryYAxis: NumericAxis(
                      isVisible: false,
                      majorGridLines: MajorGridLines(width: 0),
                      minimum: 0,
                      maximum: 1
                  ),
                  primaryXAxis: NumericAxis(
                    isVisible: false,
                    majorGridLines: MajorGridLines(width: 0),
                    majorTickLines: MajorTickLines(size: 0),
                    minimum: 63,
                    maximum: 70,
                    interval: 1,
                  ),
                  series: <CartesianSeries>[
                    ScatterSeries<WonderWeekData, int>(
                      dataSource: markerWeek70DataDocile,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: 11,
                          width: 11,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/sunny.png')
                      ),
                    ),
                    ScatterSeries<WonderWeekData, double>(
                      dataSource: markerBaby,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: heightMarkerBaby,
                          width: widthMarkerBaby,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/baby.png')
                      ),
                    ),
                  ],
                )
              ]
          )
      ),
    );
  }

  SfCartesianChart getTrackerBarWeek70() {
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
          axisLine: AxisLine(width: widthBorderChart, color: colorBorder),
          minimum: 63,
          maximum: 70,
          interval: 1,
        ),
        series: getStackedBarSeriesWeek70()
    );
  }

  List<StackedBarSeries<WonderWeekData, int>> getStackedBarSeriesWeek70() {
    return <StackedBarSeries<WonderWeekData, int>>[
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week70data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.y,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week70data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week70data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue2,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week70data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue3,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week70data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue4,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week70data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue5,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week70data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue6,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week70data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue7,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week70data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue8,
      ),
    ];
  }
}

class BuildChartWonderWeek77 extends StatelessWidget {
  final List<WonderWeekData> markerBaby;

  BuildChartWonderWeek77({Key key, this.markerBaby}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Center(
          child: Stack(
              children: [
                getTrackerBarWeek77(),
                SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  primaryYAxis: NumericAxis(
                      isVisible: false,
                      majorGridLines: MajorGridLines(width: 0),
                      minimum: 0,
                      maximum: 1
                  ),
                  primaryXAxis: NumericAxis(
                    isVisible: false,
                    majorGridLines: MajorGridLines(width: 0),
                    majorTickLines: MajorTickLines(size: 0),
                    minimum: 70,
                    maximum: 77,
                    interval: 1,
                  ),
                  series: <CartesianSeries>[
                    ScatterSeries<WonderWeekData, double>(
                      dataSource: markerWeek77DataRain,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: 11,
                          width: 11,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/cloud.png')
                      ),
                    ),
                    ScatterSeries<WonderWeekData, double>(
                      dataSource: markerBaby,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: heightMarkerBaby,
                          width: widthMarkerBaby,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/baby.png')
                      ),
                    ),
                  ],
                )
              ]
          )
      ),
    );
  }

  SfCartesianChart getTrackerBarWeek77() {
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
          axisLine: AxisLine(width: widthBorderChart, color: colorBorder),
          minimum: 70,
          maximum: 77,
          interval: 1,
        ),
        series: getStackedBarSeriesWeek77()
    );
  }

  List<StackedBarSeries<WonderWeekData, int>> getStackedBarSeriesWeek77() {
    return <StackedBarSeries<WonderWeekData, int>>[
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week77data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.y,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week77data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week77data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue2,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week77data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue3,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week77data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue4,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week77data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue5,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week77data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue6,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week77data,
        color: colorGrumpy,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue7,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week77data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue8,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week77data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue9,
      ),
    ];
  }
}

class BuildChartWonderWeek84 extends StatelessWidget {
  final List<WonderWeekData> markerBaby;

  BuildChartWonderWeek84({Key key, this.markerBaby}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Center(
          child: Stack(
              children: [
                getTrackerBarWeek84(),
                SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  primaryYAxis: NumericAxis(
                      isVisible: false,
                      majorGridLines: MajorGridLines(width: 0),
                      minimum: 0,
                      maximum: 1
                  ),
                  primaryXAxis: NumericAxis(
                    isVisible: false,
                    majorGridLines: MajorGridLines(width: 0),
                    majorTickLines: MajorTickLines(size: 0),
                    minimum: 77,
                    maximum: 84,
                    interval: 1,
                  ),
                  series: <CartesianSeries>[
                    ScatterSeries<WonderWeekData, int>(
                      dataSource: markerWeek84DataDocile,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: 11,
                          width: 11,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/sunny.png')
                      ),
                    ),
                    ScatterSeries<WonderWeekData, double>(
                      dataSource: markerBaby,
                      xValueMapper: (WonderWeekData sales, _) => sales.x,
                      yValueMapper: (WonderWeekData sales, _) => sales.y,
                      markerSettings: MarkerSettings(
                          height: heightMarkerBaby,
                          width: widthMarkerBaby,
                          isVisible: true,
                          shape: DataMarkerType.image,
                          image: AssetImage('images/baby.png')
                      ),
                    ),
                  ],
                )
              ]
          )
      ),
    );
  }

  SfCartesianChart getTrackerBarWeek84() {
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
          axisLine: AxisLine(width: widthBorderChart, color: colorBorder),
          minimum: 77,
          maximum: 84,
          interval: 1,
        ),
        series: getStackedBarSeriesWeek84()
    );
  }

  List<StackedBarSeries<WonderWeekData, int>> getStackedBarSeriesWeek84() {
    return <StackedBarSeries<WonderWeekData, int>>[
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week84data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.y,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week84data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week84data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue2,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week84data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue3,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week84data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue4,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week84data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue5,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week84data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue6,
      ),
      StackedBarSeries<WonderWeekData, int>(
        dataSource: week84data,
        color: Colors.transparent,
        borderColor: colorBorder,
        borderWidth: widthBorderChart,
        width: heightWonderWeekChart,
        xValueMapper: (WonderWeekData sales, _) => sales.x,
        yValueMapper: (WonderWeekData sales, _) => sales.yValue7,
      ),
    ];
  }
}

class BuildNoteWonderWeek extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 25, 10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 23,
                height: 17,
                color: colorGrumpy,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7.5),
                child: Text('Bé sẽ trở nên cực kì khó tính trong những ngày này', style: TextStyle(fontSize: 12),),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Row(
              children: [
                Container(
                  width: 23,
                  height: 17,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: colorBorder,
                      width: widthBorderChart
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7.5),
                  child: Text('Bé đang ở giai đoạn tương đối thoải mái', style: TextStyle(fontSize: 12),),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Row(
              children: [
                Image.asset(
                  'images/cloud.png',
                  width: 23,
                  height: 17,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7.5),
                  child: Text('Rất có khả năng bé sẽ gây ra "bão tố" ', style: TextStyle(fontSize: 12),),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Row(
              children: [
                Image.asset(
                  'images/sunny.png',
                  width: 23,
                  height: 17,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7.5),
                  child: Text('Thời gian này, hãy hi vọng bé sẽ tỏ ra ngoan ngoãn', style: TextStyle(fontSize: 12),),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 23,
                  height: 17,
                  margin: const EdgeInsets.only(right: 7.5),
                  color: colorPettish,
                ) ,
                Container(
                  child: Flexible(
                    child: Text(
                      'Khi bé trở nên gắt gỏng trong khoảng thời gian từ tuần 29-31, đây không phải là dấu hiệu bắt đầu từ một thời kỳ nhõng nhẽo mới. Đơn giản chỉ là vào thời điểm này của cuộc đời, trẻ sơ sinh bắt đầu nhận ra rằng mẹ đang bỏ đi. Kỹ năng xác định khoảng cách của bé đang hoàn thiện',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}





