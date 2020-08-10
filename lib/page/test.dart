
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: ListView(
        children: <Widget>[
            ListTile(title: Text("普通ListView")),
            ListTile(
                title: Text("ListView.build"),
                onTap: () {
                  Navigator.pushNamed(context, '/listview_build');
                }),
            ListTile(
                title: Text("ListView.buildMultiTypeItem"),
                onTap: () {
                  Navigator.pushNamed(context, '/listview_build_multi');
                }),
            ListTile(
                title: Text("ListView.seperate"),
                onTap: () {
                  Navigator.pushNamed(context, '/listview_separate');
                }),
            ListTile(
                title: Text("ListView.suctom"),
                onTap: () {
                  Navigator.pushNamed(context, '/listview_custom');
                }),
          ],
      ),
    );
  }
}