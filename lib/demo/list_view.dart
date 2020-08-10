import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart'; //随机生成单纯的库

//固定cell的listView
class simpleListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("简单的listView"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text("ListView")),
          ListTile(title: Text("ListView"), onTap: () {}),
          ListTile(title: Text("ListView"), onTap: () {}),
          ListTile(title: Text("ListView"), onTap: () {}),
          ListTile(title: Text("ListView"), onTap: () {}),
        ],
      ),
    );
  }
}

//固定样式的cell 但是懒加载 且可以根据数据来显示个数
class ListViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListViewBuilder"),
        ),
        body: ListView.builder(
            itemCount: 100,
            itemExtent: 50.0, //强制高度为50.0
            itemBuilder: (BuildContext context, int index) {
              return ListTile(subtitle: Text("zz"), title: Text("$index"));
            }));
  }
}

class ListViewSeparated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(color: Colors.green);
    return Scaffold(
        appBar: AppBar(
          title: Text("ListViewSeparated"),
        ),
        body: ListView.separated(
          itemCount: 100,
          //列表项构造器
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text("$index"));
          },
          //分割器构造器
          separatorBuilder: (BuildContext context, int index) {
            return index % 2 == 0 ? divider1 : divider2;
          },
        ));
  }
}

class ListViewCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListViewSeparated"),
        ),
        body: ListView.custom(childrenDelegate: CustomSliverChildDelegate()));
  }
}

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        //如果到了表尾
        if (_words[index] == loadingTag) {
          //不足100条，继续获取数据
          if (_words.length - 1 < 100) {
            //获取数据
            _retrieveData();
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)),
            );
          } else {
            //已经加载了100条数据，不再获取数据。
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ));
          }
        }
        //显示单词列表项
        return ListTile(title: Text(_words[index]));
      },
      separatorBuilder: (context, index) => Divider(height: .1),
    ));
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(
            _words.length - 1,
            //每次生成20个单词
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      });
    });
  }
}

class CustomSliverChildDelegate extends SliverChildDelegate {
  /// 根据index构造child
  @override
  Widget build(BuildContext context, int index) {
    // KeepAlive将把所有子控件加入到cache，已输入的TextField文字不会因滚动消失
    // 仅用于演示
    return KeepAlive(
        keepAlive: true,
        child: TextField(decoration: InputDecoration(hintText: '请输入')));
  }

  /// 决定提供新的childDelegate时是否需要重新build。在调用此方法前会做类型检查，不同类型时才会调用此方法，所以一般返回true。
  @override
  bool shouldRebuild(SliverChildDelegate oldDelegate) {
    return true;
  }

  /// 提高children的count，当无法精确知道时返回null。
  /// 当 build 返回 null时，它也将需要返回一个非null值
  @override
  int get estimatedChildCount => 100;

  /// 预计最大可滑动高度，如果设置的过小会导致部分child不可见，设置报错
  @override
  double estimateMaxScrollOffset(int firstIndex, int lastIndex,
      double leadingScrollOffset, double trailingScrollOffset) {
    return 2500;
  }

  /// 完成layout后的回调，可以通过该方法获已完成布局的视图树包括哪些子控件
  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    print('didFinishLayout firstIndex=$firstIndex firstIndex=$lastIndex');
  }
}
