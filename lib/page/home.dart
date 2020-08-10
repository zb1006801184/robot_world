import 'package:flutter/material.dart';
import '../demo/list_view.dart';
import 'test.dart';
import 'package:robot_world/demo/list_view.dart';
import 'package:robot_world/navigator/tab_navigator.dart';
import 'package:flutter/services.dart';
import 'package:robot_world/page_index.dart';

import 'dart:async';

class Home extends StatelessWidget {
  bool login = false;

  @override
  Widget build(BuildContext context) {
    //已登录
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        brightness: Brightness.light,
        leading: Text(''),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("ListView"),
            onTap: () {
              Navigator.pushNamed(context, '/listView');
            },
          ),
          ListTile(
              title: Text("TextDemo"),
              onTap: () {
                Navigator.pushNamed(context, '/textDemo');
              }),
          ListTile(
              title: Text("LayoutViewDemo"),
              onTap: () {
                Navigator.pushNamed(context, "/LayoutView");
              }),
          ListTile(
              title: Text("bp_on_line"),
              onTap: () {
                Navigator.pushNamed(context, "/Person");
              }),
          ListTile(
              title: Text("无限加载"),
              onTap: () {
                Navigator.pushNamed(context, "/TestList");
              }),
          ListTile(
              title: Text("网络请求"),
              onTap: () {
                Navigator.pushNamed(context, "/NetWork");
              }),
          ListTile(
              title: Text("login"),
              onTap: () {
                Navigator.pushNamed(context, "/Login");
              }),
          ListTile(
              title: Text("refreshDemo"),
              onTap: () {
                Navigator.pushNamed(context, "/RefreshDemo");
              }),
          ListTile(
              title: Text("ExpansionTileDemo"),
              onTap: () {
                Navigator.pushNamed(context, "/ExpansionTileDemo");
              }),
              ListTile(
              title: Text("MapDemo"),
              onTap: () {
                Navigator.pushNamed(context, "/MapDemo");
              }),
        ],
      ),
    );
  }
}
