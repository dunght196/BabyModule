import 'package:cloud_firestore/cloud_firestore.dart';

class IndexBaby {
  final String height;
  final String weight;
  final String perimeter;
  final String date;

  IndexBaby(this.height, this.weight, this.perimeter, this.date);

  IndexBaby.fromSnapshot(DocumentSnapshot snapshot)
      : height = snapshot['height'],
        weight = snapshot['weight'],
        perimeter = snapshot['perimeter'],
        date = snapshot.documentID;

  Map<String, dynamic> toJson() => {
        'height': height,
        'weight': weight,
        'perimeter': perimeter
      };
}
