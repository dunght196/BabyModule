import 'dart:ffi';

import 'package:baby_index_module/IndexBaby.dart';
import 'package:baby_index_module/chart.dart';
import 'package:baby_index_module/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'IndexBabyScreen.dart';

class Home extends StatefulWidget {
  static final heightTextField = 40.0;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final tftWeight = TextEditingController();
  final tftHeight = TextEditingController();
  final tftPerimeter = TextEditingController();
  final tftDate = TextEditingController();

  final databaseReference = Firestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    tftWeight.dispose();
    tftHeight.dispose();
    tftPerimeter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: null,
        ),
        titleSpacing: 0.0,
        title: Text('Thêm chỉ số cho bé'),
        actions: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 7),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IndexBabyScreen()));
                },
                child: Text(
                  'Tất cả chỉ số',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: Text('Bé'),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  height: Home.heightTextField,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.accessibility),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text('Dũng'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 20, 0, 0),
                  child: Text('Cân nặng'),
                ),
                _buidFormIndex('kg', tftWeight),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 20, 0, 0),
                  child: Text('Chiều cao'),
                ),
                _buidFormIndex("cm", tftHeight),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 20, 0, 0),
                  child: Text('Chu vi đầu'),
                ),
                _buidFormIndex("cm", tftPerimeter),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 20, 0, 0),
                  child: Text('Ngày'),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _buildFormDate(),
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {
                      addIndexBaby(context);
                    },
                    child: RaisedButton(
                      child: Text('Thêm'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0),
            child: _buildChart(Constant.WEIGHT),
          ),
          _buildLine(),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: _buildChart(Constant.HEIGHT),
          ),
          _buildLine(),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: _buildChart(Constant.PERIMETER),
          ),
        ],
      ),
      // body is the majority of the screen.
    );
  }

  Widget _buidFormIndex(String index, TextEditingController _controller) {
    return Stack(
      children: <Widget>[
        Container(
          height: Home.heightTextField,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            decoration: InputDecoration(
//                      contentPadding: EdgeInsets.symmetric(vertical: 50),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey[300])),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey[300])),
            ),
            controller: _controller,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 40,
            height: Home.heightTextField,
            decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Center(child: Text(index)),
          ),
        )
      ],
    );
  }

  Widget _buildFormDate() {
    return Row(
      children: <Widget>[
        Container(
          width: 40,
          height: Home.heightTextField,
          decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20))),
          child: Center(child: Icon(Icons.calendar_today, size: 15)),
        ),
        Expanded(
          child: Container(
            height: Home.heightTextField,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              decoration: InputDecoration(
//                      contentPadding: EdgeInsets.symmetric(vertical: 50),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    borderSide: BorderSide(color: Colors.grey[300])),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    borderSide: BorderSide(color: Colors.grey[300])),
              ),
              controller: tftDate,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChart(String title) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(title),
              )),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text('Bảng chỉ số chuẩn'),
              ),
            ],
          ),
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
                child: Text('Ngưỡng dưới', style: TextStyle(fontSize: 10),),
              ),
              Container(
                color: Colors.green[900],
                width: 8,
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text('Ngưỡng trên', style: TextStyle(fontSize: 10),),
              ),
              Container(
                color: Colors.grey,
                width: 8,
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text('Dự đoán', style: TextStyle(fontSize: 10),),
              ),
              Container(
                color: getColorExplain(title),
                width: 8,
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(title, style: TextStyle(fontSize: 10)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 38,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Colors.grey,
                          width: 1.0
                        )
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Chi tiết'),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 38,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Xem toàn màn hình'),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ]
    );
  }

  Widget _buildLine() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 15,
      color: Colors.grey[300],
    );
  }

  void addIndexBaby(BuildContext context) async {
    IndexBaby mapData = IndexBaby(
        tftHeight.text, tftWeight.text, tftPerimeter.text, tftDate.text);
    await databaseReference
        .collection('baby')
        .document('cun')
        .collection('date')
        .document(tftDate.text)
        .setData(mapData.toJson());
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => IndexBabyScreen()));
  }

  Color getColorExplain(String title) {
    switch(title) {
      case Constant.WEIGHT: {
        return Colors.blue[700];
      }
      break;

      case Constant.HEIGHT: {
        return Colors.lightGreen;
      }
      break;

      case Constant.PERIMETER: {
        return Colors.cyan[100];
      }
      break;

      default:
        return Colors.blue;
        break;
    }
  }
}
