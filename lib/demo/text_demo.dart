import 'package:flutter/material.dart';

class textDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("textDemo"),
      ),
      body: DefaultTextStyle(
        //1.设置文本默认样式
        style: TextStyle(
          color: Colors.red,
          fontSize: 20.0,
        ),
        textAlign: TextAlign.start,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("hello world"),
            Text("I am Jack"),
            Text(
              "I am Jack",
              style: TextStyle(
                  inherit: true, //2.不继承默认样式
                  color: Colors.grey),
            ),

            //按钮
            RaisedButton(
              child: Text("normal"),
              onPressed: () {
                print("normal");
              },
            ),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {},
            ),
            RaisedButton.icon(
              icon: Icon(Icons.send),
              label: Text("发送"),
              onPressed: () {},
            ),
            OutlineButton.icon(
              icon: Icon(Icons.add),
              label: Text("添加"),
              onPressed: () {},
            ),
            FlatButton.icon(
              icon: Icon(Icons.info),
              label: Text("详情"),
              onPressed: () {},
            ),
//图片
            Image(
              image: AssetImage("images/home_pic_start.png"),
              width: 100,
              height: 100,
            ),
            Image(
              image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 100.0,
            )
          ],
        ),
      ),
    );
  }
}
