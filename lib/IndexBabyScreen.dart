import 'package:baby_index_module/DetailIndexBabyScreen.dart';
import 'package:baby_index_module/IndexBaby.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndexBabyScreen extends StatefulWidget {
  @override
  _IndexBabyState createState() => _IndexBabyState();
}

class _IndexBabyState extends State<IndexBabyScreen> {
  final databaseReference = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          titleSpacing: 0.0,
          title: Text('Chỉ số của bé')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.blue[100],
          height: 65,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Center(child: Text('Ngày'))),
              Expanded(child: Center(child: Text('Cân nặng'))),
              Expanded(child: Center(child: Text('Chiều cao'))),
              Expanded(child: Center(child: Text('Chu vi đầu'))),
            ],
          ),
        ),
        StreamBuilder(
          stream: databaseReference
              .collection('baby')
              .document('cun')
              .collection('date')
              .snapshots(),
          builder: (context, snapshot) {
            print("Snapshot: ${snapshot.data}");
            if (!snapshot.hasData) return LinearProgressIndicator();
            return _buildList(context, snapshot.data.documents);
          },
        )
      ],
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return Expanded(
//      child: ListView(
//        children: snapshot.map((data) => _buildListItem(context, data, snapshot.elementAt(snapshot.indexOf(data)), snapshot.)).toList(),
//      ),
        child: ListView.builder(
            itemCount: snapshot.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildListItem(context, snapshot, index);
            }));
  }

  Widget _buildListItem(
      BuildContext context, List<DocumentSnapshot> data, int position) {
    final index = IndexBaby.fromSnapshot(data[position]);
    var rangeWeight = 0;
    var rangeHeight = 0;
    var rangePerimeter = 0;
    if (position > 0) {
      final indexBefore = IndexBaby.fromSnapshot(data[position - 1]);
      rangeWeight = int.parse(index.weight) - int.parse(indexBefore.weight);
      rangeHeight = int.parse(index.height) - int.parse(indexBefore.height);
      rangePerimeter = int.parse(index.perimeter) - int.parse(indexBefore.perimeter);
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailIndexBabyScreen(indexBaby: index)));
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[300]))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Center(child: Text(index.date))),
            Expanded(child: compareIndex(index.weight, rangeWeight)),
            Expanded(child: compareIndex(index.height, rangeHeight)),
            Expanded(child: compareIndex(index.perimeter, rangePerimeter)),
          ],
        ),
      ),
    );
  }

  Widget compareIndex(String value, int rangeValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rangeValue == 0
          ? <Widget>[Text(value)]
          : <Widget>[
              Text(value),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                      rangeValue > 0 ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: rangeValue > 0 ? Colors.green : Colors.red,
                      size: 20),
                  Text(
                    rangeValue.abs().toString(),
                    style: TextStyle(fontSize: 10, color: rangeValue > 0 ? Colors.green : Colors.red),
                  )
                ],
              )
            ],
    );
  }
}
