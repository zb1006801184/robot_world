import 'package:robot_world/page_index.dart';

class FounderResultPage extends StatefulWidget {
  @override
  _FounderResultPageState createState() => _FounderResultPageState();
}

class _FounderResultPageState extends State<FounderResultPage> {
  List<Widget> _buildWorkList(List listData) {
    List<Widget> result = [];
    for (var item in listData) {
      result.add(Container(
        margin: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Text(
          item,
          style: TextStyle(fontSize: 16),
        ),
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("images/bg_pic_top.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: Global.ksStateHeight +
                              Global.ksToolbarHeight +
                              16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            width: 114,
                            height: 152,
                            color: Colors.red,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Text(
                                    "廖洋",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Color(0xFF1F3ABB),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10, top: 10),
                                  width: Global.ksWidth - 16 - 24 - 10 - 114,
                                  child: Text(
                                    "出生年月：1980-01-01",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10, top: 10),
                                  width: Global.ksWidth - 16 - 24 - 10 - 114,
                                  child: Text(
                                    "毕业院校：乌兰察布医学高等专科学校",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10, top: 10),
                                  width: Global.ksWidth - 16 - 24 - 10 - 114,
                                  child: Text(
                                    "婚姻状态：保密",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10, top: 10),
                                  width: Global.ksWidth - 16 - 24 - 10 - 114,
                                  child: Text(
                                    "学历：专科",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //工作经历
                    Container(
                        margin: EdgeInsets.only(top: 8, left: 16),
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
                                "工作经历",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            ),
                          ],
                        )),
                    Container(
                      child: Column(
                        children: _buildWorkList([
                          "2020.01-2020.05  为解决者建立一个展示自己真实能力的平台，用自己的闲时对接项目。",
                          "2019.01-2020.01  为解决者建立一个展示自己真实能力的平台，用自己的闲时对接项目。"
                        ]),
                      ),
                    ),
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
                                "个人描述：",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            ),
                          ],
                        )),
                    Container(
                      child: Column(
                        children: _buildWorkList([
                          "2020.01-2020.05  为解决者建立一个展示自己真实能力的平台，用自己的闲时对接项目。",
                          "2019.01-2020.01  为解决者建立一个展示自己真实能力的平台，用自己的闲时对接项目。"
                        ]),
                      ),
                    ),
                  ],
                )),
            Positioned(
                bottom: 12,
                child: ResultBottomButton("修改", "下一页", () {}, () {
                  Navigator.of(context).pushNamed("/CofounderListPage");
                }))
          ],
        ),
      ),
    );
  }
}
