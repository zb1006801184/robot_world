import 'package:flutter/material.dart';
import 'dart:ui';

class layoutView extends StatelessWidget {
  final width = window.physicalSize.width;
  final height = window.physicalSize.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("布局演示"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.green,
              constraints:
                  BoxConstraints.tightFor(width: width, height: 590), //卡片大小
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    child: Column(
                      children: <Widget>[
                        Text("hello world zzzzzwidth:$width height:$height"),
                        Text("I am Jack "),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    child: Column(
                      children: <Widget>[
                        Text("hello world zzzzzssss"),
                        Text("I am Jack "),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
