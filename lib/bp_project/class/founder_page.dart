import 'package:robot_world/page_index.dart';

class FounderPage extends StatefulWidget {
  @override
  _FounderPageState createState() => _FounderPageState();
}

class _FounderPageState extends State<FounderPage> {
  List workList = [""];

  List<Widget> _buildWorkList() {
    List<Widget> result = [];
    for (var item in workList) {
      result.add(MuchLineInput(
        titles: "工作经历（请倒序讲述您的工作经历）",
        placeholderTitle: "请填写工作经历",
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBarBase().configAppBar("创始人简介"),
      body: GestureDetector(
        child: Stack(
          children: [
            Container(
              width: Global.ksWidth,
              height: Global.ksHeight,
              child: ListView(
                children: [
                  OneLineInput(
                    titles: "姓名",
                    placeholderTitle: "请填写姓名",
                  ),
                  OneLineSelect(
                    titles: "性别",
                    placeholderTitle: "选择性别",
                  ),
                  OneLineSelect(
                    titles: "出生年月",
                    placeholderTitle: "选择出生年月",
                  ),
                  OneLineInput(
                    titles: "毕业院校",
                    placeholderTitle: "请填写毕业院校",
                  ),
                  OneLineSelect(
                    titles: "学历",
                    placeholderTitle: "请选择",
                  ),
                  OneLineSelect(
                    titles: "婚姻状态",
                    placeholderTitle: "请选择",
                  ),
                  Container(
                    child: Column(
                      children: _buildWorkList(),
                    ),
                  ),
                  Container(
                    height: 16,
                    color: Color(0xFFF4F5F7),
                  ),
                  GestureDetector(
                    child: Container(
                      color: Color(0xFFF4F5F7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image(
                              image: AssetImage("images/profile_icon_add.png"),
                            ),
                          ),
                          Text(
                            " 增加一段工作经历",
                            style: TextStyle(
                                color: Color(0xFF0FA2FF), fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                  MuchLineInput(
                    titles: "个人描述",
                    placeholderTitle:
                        "简单讲一下你的生活、爱好、理想，有什么想对投资人说的都可以简单表达（500字以内）",
                  ),
                ],
              ),
            ),
            Positioned(bottom: 12, child: CommitBottomButton("提交", () {
              Navigator.of(context).pushNamed("/FounderResultPage");
            }))
          ],
        ),
      ),
    );
  }
}
