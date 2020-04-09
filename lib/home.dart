import 'package:baby_index_module/IndexBaby.dart';
import 'package:baby_index_module/build_chart_index.dart';
import 'package:baby_index_module/chart.dart';
import 'package:baby_index_module/app_util.dart';
import 'package:baby_index_module/chart_detail_fullscreen.dart';
import 'package:baby_index_module/dummy_data.dart';
import 'package:baby_index_module/table_index_data.dart';
import 'package:baby_index_module/wonderweek_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mp_chart/mp/core/entry/entry.dart';
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

  final databaseReference = Firestore.instance.collection('baby').document('cun').collection('date');
  DateTime _date = DateTime.now();
  var txtDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  var markerBaby = Entry();
  var dateOfBirthBaby = "02-02-2019";

  QuerySnapshot querySnapshot;
  List<DocumentSnapshot> listSnapshot;

  @override
  void initState() {
    super.initState();
    var date1 = DateTime.parse('2020-01-02');
    var date2 = DateTime.parse('2020-02-02');
    final difference = date2.difference(date1).inDays;
    var week = num.parse((difference / 7).toStringAsFixed(2));
    var offsetYBaby = (week/7).floor().toDouble();
    var offsetXBaby = week - (7*offsetYBaby);
    markerBaby = Entry(x: offsetXBaby, y: 12-offsetYBaby);


    getIndexList().then((results){
      setState(() {
        listSnapshot = results.documents;
      });
    });
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
        children: [
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
          _buildLine(),
          _buildWonderWeek(),
          _buildLine(),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: BuildChartIndex(
                AppUtil.WEIGHT,
                DummyData.createBelowLineWeightBoy(),
                DummyData.createTopLineWeightBoy(),
                listSnapshot,
                dateOfBirthBaby,
            ),
          ),
          _buildLine(),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: BuildChartIndex(
              AppUtil.HEIGHT,
              DummyData.createBelowLineHeightBoy(),
              DummyData.createTopLineHeightBoy(),
              listSnapshot,
              dateOfBirthBaby,
            ),
          ),
          _buildLine(),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: BuildChartIndex(
              AppUtil.PERIMETER,
              DummyData.createBelowLinePerimeterBoy(),
              DummyData.createTopLinePerimeterBoy(),
              listSnapshot,
              dateOfBirthBaby,
            ),
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
            child: GestureDetector(
          onTap: () {
            _selectDate(context);
          },
          child: Container(
            height: Home.heightTextField,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                border: Border.all(color: Colors.grey[350])),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(DateFormat('dd-MM-yyyy').format(_date)),
                )),
          ),
        )),
      ],
    );
  }

  Widget _buildLine() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 20,
      color: Colors.grey[200],
    );
  }

  Widget _buildWonderWeek() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 12),
          child: Text('Wonder Week',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 10),
          child: Text('Thời điểm nhõng nhẽo của trẻ'),
        ),
        BuildWonderWeek(markerBaby: markerBaby,),
        BuildNoteWonderWeek(),
      ],
    );
  }

  void addIndexBaby(BuildContext context) async {
    IndexBaby mapData = IndexBaby(
        tftDate.text, tftHeight.text, tftWeight.text, tftPerimeter.text);
    await databaseReference
        .document(txtDate)
        .setData(mapData.toJson());
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => IndexBabyScreen()));
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2016),
      initialDate: DateTime.now(),
      lastDate: DateTime(2021),
    );

    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        txtDate = DateFormat('dd-MM-yyyy').format(_date);
      });
    }
  }

  Future<QuerySnapshot> getIndexList() async {
    return await databaseReference.getDocuments();
  }

}
