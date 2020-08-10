import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List dataList = [
      {
        "title": "A1",
        "dataList": ["a11", "a12", "a13"]
      },
      {
        "title": "A2",
        "dataList": ["a21", "a22", "a23"]
      },
    ];

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('ExpansionTileDemo'),
        ),
        body: new ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              itemWidget(dataList[index]["dataList"], dataList[index]["title"]),
          itemCount: dataList.length,
        ),
      ),
    );
  }
}

class itemWidget extends StatelessWidget {
  final List dataList;
  final String title;
  itemWidget(this.dataList, this.title);

  List<Widget> subItem(List data) {
    List<Widget> result = [];
    for (var item in data) {
      result.add(
        ListTile(
          title: Text(item),
        ),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      children: subItem(dataList),
    );
  }
}
