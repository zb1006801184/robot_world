import 'package:robot_world/page_index.dart';

class NavBarBase extends StatelessWidget {
  
  AppBar configAppBar(String title) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      leading: Text(''),
      backgroundColor: Color(0xFFf4f5f7),
      elevation: 0, //阴影辐射范围
      brightness: Brightness.light,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
