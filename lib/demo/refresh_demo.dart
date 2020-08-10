import 'package:robot_world/page_index.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:robot_world/generated/i18n.dart';
class RefreshDemo extends StatefulWidget {
  @override
  _RefreshDemoState createState() => _RefreshDemoState();
}

class _RefreshDemoState extends State<RefreshDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBarBase().configAppBar("刷新"),
      body: EasyRefresh(
        emptyWidget: null,
        bottomBouncing:false,
        header: ClassicalHeader(
          refreshText: S.of(context).pullToRefresh,
          refreshReadyText: "释放刷新",
          refreshingText: "正在刷新",
          refreshedText: "刷新完成",
          infoText:"更新于 %T",
        ),
        child: ListView(
          children: [
            ListTile(
              title: Text("zzzz1"),
            ),
            ListTile(
              title: Text("zzzz"),
            ),
            ListTile(
              title: Text("zzzz"),
            ),
          ],
        ),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            print("刷新");
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            print("加载");
          });
        },
      ),
    );
  }
}
