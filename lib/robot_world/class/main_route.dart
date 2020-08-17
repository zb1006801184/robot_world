import 'package:robot_world/page_index.dart';
import 'package:robot_world/robot_world/class/robor_world_home.dart';
import 'dart:io';
import 'school/robot_world_school.dart';

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectedIndex = 0;
  String title = "R世界";
  List<Widget> bodyList;
  List titles = ["R世界", "R社交", "R学校", "R小窝", "R主人"];

  Widget itemViewC(int index) {
    
    if (index == 0 && !PlatformUtils.isWeb) {
      return RobotWorldHome();
    }
    if (index == 2) {
      return RobotWorldSchool();
    }
    return Container(
      child: Center(
        child: Text(titles[index]),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //导航栏
          title: Text(title,style: TextStyle(color: Color(0xFF121212)),),
          backgroundColor: Colors.white,
          elevation: 0, //阴影辐射范围
          brightness: Brightness.light,
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
            BottomNavigationBarItem(icon: Image(image: AssetImage("images/tab_icon_world_h.png")), activeIcon: Image(image: AssetImage("images/tab_icon_world.png")),title: Text('R世界')),
            BottomNavigationBarItem(
                icon: Image(image: AssetImage("images/tab_icon_contact_h.png")), activeIcon: Image(image: AssetImage("images/tab_icon_contact.png")),title: Text('R社交')),
            BottomNavigationBarItem(
                icon: Image(image: AssetImage("images/tab_icon_sc.png")), activeIcon: Image(image: AssetImage("images/tab_icon_sc_h.png")), title: Text('R学校')),
            BottomNavigationBarItem(
                icon: Image(image: AssetImage("images/tab_icon_home_h.png")),activeIcon: Image(image: AssetImage("images/tab_icon_home.png")), title: Text('R小窝')),
            BottomNavigationBarItem(
                icon: Image(image: AssetImage("images/tab_me_h.png")), activeIcon: Image(image: AssetImage("images/tab_me.png")),title: Text('R主人')),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF00BFD8),
          unselectedItemColor: Color(0xFF999999),
          onTap: _onItemTapped,
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            itemViewC(0),
            itemViewC(1),
            itemViewC(2),
            itemViewC(3),
            itemViewC(4),
          ],
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      title = titles[index];
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
