import 'package:flutter/rendering.dart';

import '../../../page_index.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class RobotWorldSchool extends StatefulWidget {
  @override
  _RobotWorldSchoolState createState() => _RobotWorldSchoolState();
}

class _RobotWorldSchoolState extends State<RobotWorldSchool> {
  int _selectIndex = 0;
  List titles = ["分类一", "分类二", "分类三"];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      color: Color(0xFFF6F6F6),
      child: Column(
        children: [
          _topTabs(),
          Expanded(
              child: ListView(
            children: [_headTitle(titles[_selectIndex]), _mainContent()],
          ))
        ],
      ),
    );
  }

  //顶部tabs
  Widget _topTabs() {
    return Container(
      width: Global.ksWidth,
      height: 48,
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Material(
          color: Colors.white,
          child: TabBar(
            indicatorColor: Colors.red,
            tabs: [
              Tab(
                text: "分类一",
              ),
              Tab(
                text: "分类二",
              ),
              Tab(
                text: "分类三",
              ),
            ],
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            unselectedLabelStyle: TextStyle(fontSize: 16),
            labelColor: Color(0xFF00BFD8),
            unselectedLabelColor: Color(0xFF666666),
            indicator: RectangularIndicator(
              color: Color(0xFF00BFD8).withOpacity(0.2),
              horizontalPadding: 17,
              verticalPadding: 9,
              bottomLeftRadius: 13,
              bottomRightRadius: 13,
              topLeftRadius: 13,
              topRightRadius: 13,
            ),
            onTap: (index) {
              setState(() {
                _selectIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }

  //title header
  Widget _headTitle(String title) {
    return Container(
        height: 44,
        padding: EdgeInsets.only(left: 17),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF121212)),
            ),
          ],
        ));
  }

  //main content
  Widget _mainContent() {
    return Container(
      height: (Global.ksWidth - 17 * 2) / 3 * 2 + 20,
      margin: EdgeInsets.only(left: 17, right: 17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),//禁止滑动
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 1, //横着
        mainAxisSpacing: 1,
        children: _item(["", "", "", "", "", ""]),
      ),
    );
  }

  List<Widget> _item(List datas) {
    List<Widget> result = [];
    for (var item in datas) {
      result.add(Container(
        padding: EdgeInsets.only(bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 66,
              width: 66,
              color: Colors.red,
              margin: EdgeInsets.only(top: 20),
            ),
            Container(
              child: Text(
                "大学机器人",
                style: TextStyle(fontSize: 14, color: Color(0xFF121212)),
              ),
            )
          ],
        ),
      ));
    }
    return result;
  }
}
