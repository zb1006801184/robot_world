//项目展望结果页
import 'package:robot_world/bp_project/person_page.dart';
import 'package:robot_world/page_index.dart';

class OutlookResultPage extends StatefulWidget {
  @override
  _OutlookResultPageState createState() => _OutlookResultPageState();
}

class _OutlookResultPageState extends State<OutlookResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Global.ksWidth,
        height: Global.ksHeight,
        child: Stack(
          children: [
            Container(
                width: Global.ksWidth,
                height: Global.ksHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 16,
                          top: Global.ksToolbarHeight +
                              Global.ksStateHeight +
                              16),
                      child: Text("项目展望",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1F3ABB))),
                    ),
                    Expanded(
                        child: ListView(
                      children: [
                        ListTile(
                          title: Text(
                            "为解决者建立一个展示自己真实能力的平台，用自己的闲时对接项目。为解决者建立一个展示自己真实能力的平台，用自己的闲时对接项目。",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    )),
                  ],
                )),
            Positioned(
                bottom: 12,
                child: ResultBottomButton("修改", "完成", () {}, () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => Person(),
                          settings: RouteSettings(arguments: {"type":"end"})),
                      (route) => route == null);
                }))
          ],
        ),
      ),
    );
  }
}
