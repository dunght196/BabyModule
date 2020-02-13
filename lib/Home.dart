import 'dart:ffi';

import 'package:baby_index_module/IndexBaby.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(23, 23, 23, 0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: Text('Bé'),
            ),
            Container(
//              width: MediaQuery.of(context).size.width,
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
              width: double.infinity,
              child: GestureDetector(
                onTap: () {
                  addIndexBaby(context);
                },
                child: RaisedButton(
                  child: Text('Thêm'),
                ),
              ),
            )
          ],
        ),
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

//  Stack _buildFormDate() {
//    return Stack(
//      children: <Widget>[
//        Container(
//          height: heightTextField,
//          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(20),
//          ),
//          child: TextField(
//            decoration: InputDecoration(
////                      contentPadding: EdgeInsets.symmetric(vertical: 50),
//              enabledBorder: OutlineInputBorder(
//                  borderRadius: BorderRadius.circular(20),
//                  borderSide: BorderSide(color: Colors.grey[300])),
//              focusedBorder: OutlineInputBorder(
//                  borderRadius: BorderRadius.circular(20),
//                  borderSide: BorderSide(color: Colors.grey[300])),
//            ),
//          ),
//        ),
//        Align(
//          alignment: Alignment.centerLeft,
//          child: Container(
//            width: 40,
//            height: heightTextField,
//            decoration: BoxDecoration(
//                color: Colors.grey[350],
//                borderRadius: BorderRadius.only(
//                    bottomLeft: Radius.circular(20),
//                    topLeft: Radius.circular(20))),
//            child: Center(child: Icon(Icons.calendar_today, size: 15)),
//          ),
//        )
//      ],
//    );
//  }
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

  void addIndexBaby(BuildContext context) async {
    IndexBaby mapData = IndexBaby(tftHeight.text, tftWeight.text, tftPerimeter.text, tftDate.text);
    await databaseReference
        .collection('baby')
        .document('cun')
        .collection('date')
        .document(tftDate.text)
        .setData(mapData.toJson());
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => IndexBabyScreen()));
  }
}
