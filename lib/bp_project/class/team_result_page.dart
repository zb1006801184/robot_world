import 'package:robot_world/page_index.dart';

class TeamResultPage extends StatefulWidget {
  @override
  _TeamResultPageState createState() => _TeamResultPageState();
}

class _TeamResultPageState extends State<TeamResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Global.ksWidth,
            height: Global.ksHeight,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("images/bg_pic_top.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 16,
                      top: Global.ksToolbarHeight + Global.ksStateHeight + 16),
                  child: Text("团队介绍",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F3ABB))),
                ),
                Expanded(
                    child: Scrollbar(
                        child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 32, left: 16),
                          child: Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                color: Colors.red,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                child: Text(
                                  "团队成员介绍：",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              )
                            ],
                          )),
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: Text(
                          "为解决者建立一个展示自己真实能力的平台，用自己的闲时对接项目。",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        height: 457,
                        margin: EdgeInsets.only(left: 16, right: 16, top: 32),
                        color: Colors.red,
                      ),
                    ],
                  ),
                )))
              ],
            ),
          ),
          Positioned(bottom: 12, child: CommitBottomButton("提交", () {
            Navigator.of(context).pushNamed("/ProjectValuationPage");
          }))
        ],
      ),
    );
  }
}
