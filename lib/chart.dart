import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartLineIndex {

  Widget _buildChart() {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        zoomPanBehavior: ZoomPanBehavior(
            enableSelectionZooming: true,
            enablePinching: true,
            enablePanning: true),
        series: <ChartSeries>[
          StackedAreaSeries<SalesData, double>(
              opacity: 0.5,
              borderColor: Colors.blue,
              borderWidth: 3,
              color: Colors.blue,
              dataSource: myFakeDesktopData,
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales),
          StackedAreaSeries<SalesData, double>(
//                          borderColor: Colors.green,
//                          borderWidth: 2,
//                          color: Colors.blue[50],
              dataSource: myFakeTabletData,
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales),
          ScatterSeries<SalesData, double>(
              color: Colors.blue,
              dataSource: myFakeMobileData,
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales),
          LineSeries<SalesData, double>(
              color: Colors.blue,
              dashArray: <double>[5, 5],
//                          borderColor: Colors.green,
//                          borderWidth: 2,
//                          color: Colors.blue[50],
              dataSource: myFakeMobileData1,
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales,
              dataLabelSettings: DataLabelSettings(isVisible: true)),
        ]);
  }
}

var myFakeDesktopData = [
  new SalesData(0, 5),
  new SalesData(5, 15),
  new SalesData(15, 30),
  new SalesData(20, 30),
  new SalesData(25, 40),
];

var myFakeTabletData = [
  new SalesData(0, 10),
  new SalesData(5, 25),
  new SalesData(15, 40),
  new SalesData(20, 30),
  new SalesData(25, 45),
];

var myFakeMobileData = [
  new SalesData(5, 80),
  new SalesData(10, 90),
];

var myFakeMobileData1 = [
  new SalesData(5, 80),
  new SalesData(10, 90),
];

var myFakeMobileData2 = [
  new SalesData(1, 250),
  new SalesData(2, 300),
];

/// Sample linear data type.
class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}
