import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//class  textTiem  extends StatelessWidget{
//  var todo;
//  textTiem({Key key, @required this.todo}) : super(key: key);
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("第二个界面"),
//      ),
//      body: new Padding(
//        padding: new EdgeInsets.all(16.0),
//        child: new Text('${todo}'),
//      ),
//    );
//  }
//}

class textTiem extends StatefulWidget {
  var todo;

  textTiem({Key key, @required this.todo}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new staTime();
  }
}

class staTime extends State<textTiem> {
  var sub;
  var id;

  @override
  void initState() {
    loadData();
    id = widget.todo['id'];
    print('title: $id');
  }

  loadData() async {
    String loadRUL =
        "http://api.douban.com/v2/movie/subject/$id?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E5%8C%97%E4%BA%AC&udid=";
    http.Response response = await http.get(loadRUL);
    var result = json.decode(response.body);
    setState(() {
      sub = result;
    });
    print(sub);
  }

  @override
  Widget build(BuildContext context) {
    var todo;
    todo = widget.todo;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("图片详情"),
        ),
        body: new Center(
          child: getbow(),
        ));
  }

//  v-original_title : "一出好戏"
  getbow() {
    if (sub != null) {
      List toa = sub["photos"];
//      print("000999 ${ sub["images"]}");
//      toa.add( sub["images"]['large']);
//      toa.add( sub["images"]['medium']);
//      toa.add( sub["images"]['small']);
      return ListView.builder(
          itemCount: toa.length,
          itemBuilder: (BuildContext context, int position) {
            print("000 ${toa[position]['image']}");
            return Container(
              margin: EdgeInsets.all(4.0),
//                     child:   CircleAvatar(
//
//                         backgroundColor: Colors.white10,
//                         backgroundImage:
//                         NetworkImage(toa[position]['image'])
//                     ),
              child: new Image.network(toa[position]['image']),
            );
            ;
          });
    } else {
      // 加载
      return CupertinoActivityIndicator();
    }
  }
}
