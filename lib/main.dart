import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() {
  Firestore.instance
      .collection('messages')
      .document('msg1')
      .setData({'from': 'Daniel', 'text': 'Hello'});

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
