
import 'package:robot_world/page_index.dart';
import 'package:robot_world/robot_world/class/robor_world_home.dart';

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectedIndex = 0;
  String title = "R世界";

  Widget itemViewC() {
    if (_selectedIndex == 0) {
      return RobotWorldHome();
    }

    return Container(
      child: Center(
        child: Text(title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //导航栏
          title: Text(title),
          actions: <Widget>[
            //导航栏右侧菜单
            // IconButton(icon: Icon(Icons.share), onPressed: () {}),
          ],
          leading: Builder(
            builder: (context) => IconButton(
              icon: Image(image: AssetImage("images/me.png")),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        drawer: new MyDrawer(), //抽屉
        bottomNavigationBar: BottomNavigationBar(
          // 底部导航
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('R世界')),
            BottomNavigationBarItem(
                icon: Icon(Icons.business), title: Text('R社交')),
            BottomNavigationBarItem(
                icon: Icon(Icons.school), title: Text('R学校')),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Text('R小窝')),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text('R主人')),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          // fixedColor: Colors.blue,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
        // floatingActionButton: FloatingActionButton(
        //     //悬浮按钮
        //     child: Icon(Icons.add),
        //     onPressed: _onAdd),
        body: itemViewC());
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      List titles = ["R世界", "R社交", "R学校", "R小窝", "R主人"];
      title = titles[_selectedIndex];
    });
  }

  void _onAdd() {}
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  _pushToRobotCenter(BuildContext context) {
    Navigator.of(context).pushNamed("/RobotCenter");
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(top: 27.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipOval(
                        child: Image.asset(
                          "images/nav_icon_me.png",
                          width: 80,
                        ),
                      ),
                    ),
                    Text(
                      "机器人世界",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              onTap: () {
                _pushToRobotCenter(context);
              },
            ),
            // Expanded(
            //   child: ListView(
            //     children: <Widget>[
            //       ListTile(
            //         leading: const Icon(Icons.add),
            //         title: const Text('Add account'),
            //       ),
            //       ListTile(
            //         leading: const Icon(Icons.settings),
            //         title: const Text('Manage accounts'),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
