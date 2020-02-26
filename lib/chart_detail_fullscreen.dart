
import 'package:baby_index_module/app_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'chart.dart';

class ChartDetailFullScreen extends StatefulWidget {
  final String title;

  ChartDetailFullScreen({Key key, @required this.title});


  @override
   _ChartDetailFullScreenState createState() => _ChartDetailFullScreenState(title);
}

class _ChartDetailFullScreenState extends State<ChartDetailFullScreen> {
  final String title;

  _ChartDetailFullScreenState(this.title);

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: SfCartesianChart(
                zoomPanBehavior:
                ZoomPanBehavior(enablePinching: true, enablePanning: true),
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
                      dataSource: myFakeMobileData1,
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      dataLabelSettings: DataLabelSettings(isVisible: true)),
                ]),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.red,
                width: 8,
                height: 8,
                margin: EdgeInsets.only(left: 45),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  'Ngưỡng dưới',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Container(
                color: Colors.green[900],
                width: 8,
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  'Ngưỡng trên',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Container(
                color: Colors.grey,
                width: 8,
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  'Dự đoán',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Container(
                color: AppUtil.getColorExplain(title),
                width: 8,
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(title, style: TextStyle(fontSize: 10)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}