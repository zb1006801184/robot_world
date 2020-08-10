import 'package:robot_world/page_index.dart';

class ProjectModelResultPage extends StatefulWidget {
  @override
  _ProjectModelResultPageState createState() => _ProjectModelResultPageState();
}

class _ProjectModelResultPageState extends State<ProjectModelResultPage> {
  List<Widget> _buildListImage(List dataList) {
    List<Widget> imageWidget = [];
    for (var item in dataList) {
      imageWidget.add(Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        height: 457,
        color: Colors.red,
      ));
    }
    return imageWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Global.ksHeight,
        width: Global.ksWidth,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("images/bg_pic_top.png"),
            fit: BoxFit.cover,
          ),
        ),
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
                        top:
                            Global.ksToolbarHeight + Global.ksStateHeight + 16),
                    child: Text("项目模式概述",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F3ABB),
                          decoration: TextDecoration.none,
                        )),
                  ),
                  Expanded(
                      child: Scrollbar(
                          child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                    "项目的模式创新描述：",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 16, top: 16, right: 16),
                          child: Text(
                            "为解决者建立一个展示自己真实能力的平台，用自己的闲时对接项目。",
                            style: TextStyle(fontSize: 16),
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
                                    "互联网演示地址：",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 16, top: 16, right: 16),
                          child: Text(
                            "www.baidu.com",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0FA2FF),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: _buildListImage(["", "", ""]),
                          ),
                        ),
                        Container(
                          height: 128,
                        )
                      ],
                    ),
                  ))),
                ],
              ),
            ),
            Positioned(
              bottom: 12,
              child: Container(
                width: Global.ksWidth,
                child: ResultBottomButton("修改", "下一页", () {
                  // _editData(context);
                }, () {
                  Navigator.of(context).pushNamed(
                    "/ProfitModelPage",
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
