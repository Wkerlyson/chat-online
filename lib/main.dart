import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() {
  Firestore.instance.collection('messages').snapshots().listen((snapshot) {
    for (DocumentSnapshot doc in snapshot.documents) {
      print(doc.data);
    }
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
