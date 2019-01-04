import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './views/videoCell.dart';
import 'package:flutter_app/DetailPage.dart';

void main() => runApp(VoongCourseApp());

//一个statefulWidget的createState方法需要一个state
class VoongCourseApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CourseState();
  }
}

//创建一个state
class CourseState extends State<VoongCourseApp> {
  var _isLoading = false;

  var videos;

  //使用http库 从api处获取json
  _fetchCoursesData() async {
    print("fetching data");
    final url = "https://api.letsbuildthatapp.com/youtube/home_feed";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      //将json解析
      final courseMap = json.decode(response.body);

      //改变state
      setState(() {
        _isLoading = false;
        this.videos = courseMap["videos"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Voong's Courses"),
          actions: <Widget>[
            // 刷新按钮点击事件
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });
                _fetchCoursesData();
              },
            )
          ],
        ),
        body: Center(
          child: _isLoading
              ? CircularProgressIndicator()
              :
              //中心的listView
              ListView.builder(
                  itemCount: this.videos != null ? this.videos.length : 0,
                  itemBuilder: (context, i) {

                    //构建一个video的Cell
                    final video = this.videos[i];
             return FlatButton(onPressed: (){
               Navigator.push(context,
                   MaterialPageRoute(builder: (context) => DetailPage(video["name"])));
                    },
                 padding: EdgeInsets.all(0),
                 child: VideoCell(video));
                  },
                ),
        ),
      ),
    );
  }
}