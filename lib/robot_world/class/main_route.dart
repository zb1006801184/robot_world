import 'package:robot_world/page_index.dart';
import 'package:robot_world/robot_world/class/world/robor_world_home.dart';
import 'school/robot_world_school.dart';
import '../class/nest/robot_center.dart';
import 'contacts/chat_page.dart';
import 'owner/owner_page.dart';
import '../login/login_page.dart';
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
    if (Global.loginState != true && index != 0) {
      return Center(
        child: Text(titles[index]),
      );
    }
    List tabbarItemsView = [
      RobotWorldHome(),
      ChatPage(),
      RobotWorldSchool(),
      RobotCenter(),
      OwnerPage()
    ]; 
    if (index == 0 && PlatformUtils.isWeb) {
      return Center(
        child: Text(titles[index]),
      );
    }
    return tabbarItemsView[index];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //右侧按钮
    Widget _rightIconButton() {
      if (_selectedIndex == 1) {
        return IconButton(
            icon: Image(image: AssetImage("images/nav_contacts.png")),
            onPressed: () {
              Navigator.of(context).pushNamed("/ContactPage");
            });
      }
      return Container();
    }

    return Scaffold(
        appBar: AppBar(
          //导航栏
          title: Text(
            title,
            style: TextStyle(color: Color(0xFF121212)),
          ),
          backgroundColor: Colors.white,
          elevation: 0, //阴影辐射范围
          brightness: Brightness.light,
          actions: <Widget>[
            //导航栏右侧菜单
            _rightIconButton(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          // 底部导航
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image(image: AssetImage("images/tab_icon_world_h.png")),
                activeIcon:
                    Image(image: AssetImage("images/tab_icon_world.png")),
                title: Text('R世界')),
            BottomNavigationBarItem(
                icon: Image(image: AssetImage("images/tab_icon_contact_h.png")),
                activeIcon:
                    Image(image: AssetImage("images/tab_icon_contact.png")),
                title: Text('R社交')),
            BottomNavigationBarItem(
                icon: Image(image: AssetImage("images/tab_icon_sc.png")),
                activeIcon:
                    Image(image: AssetImage("images/tab_icon_sc_h.png")),
                title: Text('R学校')),
            BottomNavigationBarItem(
                icon: Image(image: AssetImage("images/tab_icon_home_h.png")),
                activeIcon:
                    Image(image: AssetImage("images/tab_icon_home.png")),
                title: Text('R小窝')),
            BottomNavigationBarItem(
                icon: Image(image: AssetImage("images/tab_me_h.png")),
                activeIcon: Image(image: AssetImage("images/tab_me.png")),
                title: Text('R主人')),
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
    if (Global.loginState == true || index == 0) {
      setState(() {
        _selectedIndex = index;
        title = titles[index];
      });
    }else{
      Navigator.of(context).push(PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, Animation animation,
                      Animation secondaryAnimation) =>
                  FadeTransition(opacity: animation, child: LoginPageView())));
    }
  }

  void _onAdd() {}
}
