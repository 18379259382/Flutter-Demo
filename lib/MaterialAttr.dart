import 'dart:async';

import 'package:flutter/material.dart';

class mater extends StatefulWidget {
  @override
  State createState() {
    return new texts();
  }
}

class texts extends State<mater> {
  int _counter = 0;
int counter=0;
  void _incrementCounter() {
    if(counter!=0){

    }
    var te = new Timer.periodic(new Duration(seconds: 1), (timer) {
      counter++;
      setState(() {
        // This call to setState tells the Flutter framework that something has
        // changed in this State, which causes it to rerun the build method below
        // so that the display can reflect the updated values. If we changed
        // _counter without calling setState(), then the build method would not be
        // called again, and so nothing would appear to happen.
        _counter=counter;
      });
    });


  }

  @override
  Widget build(BuildContext context) {
    var te = "1111";
    return new MaterialApp(
        title: "窗口",
        color: Colors.red,
        theme: ThemeData(textSelectionColor: Colors.blue),
        home: new Scaffold(
          floatingActionButton: new Builder(builder: (BuildContext context) {
            return new FloatingActionButton(
              child:new Icon(Icons.access_time),
              tooltip: "Hello",
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              heroTag: null,
              elevation: 7.0,
              highlightElevation: 94.0,
onPressed: _incrementCounter,
//              onPressed: () {
//                Scaffold.of(context).showSnackBar(new SnackBar(
//                backgroundColor: Colors.red,
//                  content: new Text("FAB is Clicked",
//                  ),
//                ));
//              },
              mini: false,
              shape: new CircleBorder(),
              isExtended: false,
            );
          }),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: GestureDetector(
//            onTap: _incrementCounter,
            onDoubleTap: () => print('you double tapped the star'),
            onLongPress: () => print('you long pressed the star'),
            child: new Container(
              color: Colors.blue,
              child: Center(
                child: Text(
                  "$_counter",
                  style: new TextStyle(fontSize: 30.0, color: Colors.red),
                ),
              ),
            ),
          ),
        ));
  }
}
