import 'package:flutter/material.dart';

class VideoCell extends StatelessWidget{

  final video;

  VideoCell(this.video);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(video["imageUrl"]),
              Container(height: 8,),
              Text(video["name"],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
        Divider() //分割横线
      ],
    );
  }
}