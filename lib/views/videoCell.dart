import 'package:flutter/material.dart';

class VideoCell extends StatelessWidget{

  final video;

  VideoCell(this.video);

  @override
  Widget build(BuildContext context) {

    //圆形头像
    final profileImg = new Container(
      width: 50,
      height: 50,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(video["channel"]["profileImageUrl"]),)
      ),
    );

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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  profileImg,
                  Container(width: 8,),
                  Expanded(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          video["name"],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("views: " + video["numberOfViews"].toString())
                    ],
                  ),),
                ],
              )
            ],
          ),
        ),
        Divider() //分割横线
      ],
    );
  }
}

