import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget{

  final courseName;
  DetailPage(this.courseName);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(courseName),
      ),
      body: Center(
        child: Text("Detail in center"),
      ),
    );
  }
}