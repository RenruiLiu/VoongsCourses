import 'package:flutter/material.dart';



class DetailPage extends StatelessWidget{

  final video;
  DetailPage(this.video);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(video["name"]),
      ),
      body: Center(
        child: Text(video["link"]
        ),
      ),
    );
  }
}