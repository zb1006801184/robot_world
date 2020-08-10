import 'package:robot_world/page_index.dart';

class TechniqueResultPage extends StatefulWidget {
  @override
  _TechniqueResultPageState createState() => _TechniqueResultPageState();
}

class _TechniqueResultPageState extends State<TechniqueResultPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Global.ksHeight,
        width: Global.ksWidth,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("images/bg_pic_top.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: <Widget>[
          Container(
              width: Global.ksWidth,
              height: Global.ksHeight,
              child: Scrollbar(
                  child: SingleChildScrollView(
                child: Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 16,
                          top: Global.ksToolbarHeight +
                              Global.ksStateHeight +
                              16),
                      child: Text("项目技术概述",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1F3ABB),
                            decoration: TextDecoration.none,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 32),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            color: Colors.red,
                            width: 8,
                            height: 8,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 11),
                            child: Text(
                              "项目的技术创新描述：",
                              style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.none,
                                color: Color(0xFF2A2A2A),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, top: 16, right: 16),
                      child: Text(
                        "为解决者建立一个展示自己真实能力的平台，用自己的闲时对接项目。",
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.none,
                          color: Color(0xFF2A2A2A),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 32),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            color: Colors.red,
                            width: 8,
                            height: 8,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 11),
                            child: Text(
                              "专利类别：发明专利",
                              style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.none,
                                color: Color(0xFF2A2A2A),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 32),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            color: Colors.red,
                            width: 8,
                            height: 8,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 11),
                            child: Text(
                              "专利号：2637813678163871",
                              style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.none,
                                color: Color(0xFF2A2A2A),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, top: 32, right: 16),
                      height: 457,
                      color: Colors.red,
                    ),
                    Container(
                      height: 158,
                      // color: Colors.red,
                    ),
                  ],
                )),
              ))),
          Positioned(
            bottom: 0,
            child: Container(
              width: Global.ksWidth,
              child: ResultBottomButton("修改", "下一页", () {
                // _editData(context);
              }, () {
                Navigator.of(context).pushNamed(
                  "/ProjectModelPage",
                );
              }),
            ),
          )
        ]));
  }
}
