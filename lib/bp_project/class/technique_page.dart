import 'package:robot_world/page_index.dart';

class TechniquePage extends StatefulWidget {
  @override
  _TechniquePageState createState() => _TechniquePageState();
}

class _TechniquePageState extends State<TechniquePage> {
  @override
  Widget build(BuildContext context) {
    final controllerTechniqueDescribe = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "项目技术概述",
            style: TextStyle(color: Colors.black),
          ),
          leading: Text(''),
          backgroundColor: Color(0xFFf4f5f7),
          elevation: 0, //阴影辐射范围
          brightness: Brightness.light,
        ),
        body: Stack(
          children: [
            GestureDetector(
              child: ListView(
                children: <Widget>[
                  MuchLineInput(
                    titles: "关于项目的技术创新描述",
                    placeholderTitle: "请描述该项目的技术创新（不超过500字）",
                    controller: controllerTechniqueDescribe,
                  ),
                  SelectMuchView(
                    title: "您的项目用什么方法解决这个痛点（多选）",
                    itemList: ["已获得专利", "正在申请专利", "未申请专利"],
                    selectItemList: [],
                  ),
                ],
              ),
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
            ),
            Positioned(
              bottom: 12,
              child: CommitBottomButton("提交", () {
                Navigator.of(context).pushNamed("/TechniqueResultPage");
              }),
            )
          ],
        ));
  }
}
