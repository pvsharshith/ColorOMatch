import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(),
      body: ShapeWidget(),
    ),
  ));
}

class ShapeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShapeWidgetState();
  }
}

class _ShapeWidgetState extends State<ShapeWidget> {
  var containerOneColor = Colors.amber;
  var containerTwoColor = Colors.green;
  var containerThreeColor = Colors.red;
  var containerFourColor = Colors.indigo;
  var containerFiveColor = Colors.grey;
  var containerSixColor = Colors.yellow;
  var containerSevenColor = Colors.blue;

  var list = [
    Colors.white,
    Colors.red,
    Colors.green,
    Colors.amber,
    Colors.grey,
    Colors.indigo,
    Colors.yellow,
    Colors.blue
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: TimerApp(),
                height: 40.0,
                margin: EdgeInsets.only(left: 20.0),
              ),
            ),
            Container(
              color: Colors.blue,
              height: 30.0,
              width: 30.0,
              margin: EdgeInsets.only(right: 20.0),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  containerOneColor =
                      list[Random.secure().nextInt(list.length)];
                });
              },
              child: Container(
                height: 150.0,
                width: 150.0,
                color: containerOneColor,
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  containerTwoColor =
                      list[Random.secure().nextInt(list.length)];
                });
              },
              child: Container(
                height: 150.0,
                width: 150.0,
                color: containerTwoColor,
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  containerThreeColor =
                      list[Random.secure().nextInt(list.length)];
                });
              },
              child: Container(
                  height: 150.0, width: 150.0, color: containerThreeColor),
            ))
          ],
        ),
        Expanded(
            child: GestureDetector(
          onTap: () {
            setState(() {
              containerFourColor = list[Random.secure().nextInt(list.length)];
            });
          },
          child: Container(
            height: 100.0,
            width: 100.0,
            color: containerFourColor,
          ),
        )),
        Row(
          children: <Widget>[
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  containerFiveColor =
                      list[Random.secure().nextInt(list.length)];
                });
              },
              child: Container(
                height: 150.0,
                width: 150.0,
                color: containerFiveColor,
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  containerSixColor =
                      list[Random.secure().nextInt(list.length)];
                });
              },
              child: Container(
                height: 150.0,
                width: 150.0,
                color: containerSixColor,
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  containerSevenColor =
                      list[Random.secure().nextInt(list.length)];
                });
              },
              child: Container(
                height: 150.0,
                width: 150.0,
                color: containerSevenColor,
              ),
            ))
          ],
        ),
      ],
    ));
  }
}

class TimerApp extends StatefulWidget {
  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  int seconds = 30;
  Timer timer;

  updateTime() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (seconds > 0) {
          seconds = seconds - 1;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    updateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('$seconds Seconds'));
  }
}
