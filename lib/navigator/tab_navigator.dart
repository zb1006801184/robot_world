import 'package:flutter/material.dart';
import 'package:robot_world/page/home.dart';
import 'package:robot_world/page/dis.dart';

//tabbar  底部

class Bpline extends StatefulWidget {
  @override
  BpAppState createState() => new BpAppState();
}

class BpAppState extends State<Bpline> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new TabBarView(
          controller: controller,
          children: [
            new Dis(),
          ],
        ),
        bottomNavigationBar: new Material(
          color: Colors.blue,
          child: new TabBar(
            controller: controller,
            tabs: [
              new Tab(
                text: "发现",
                icon: new Icon(
                  Icons.book,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
