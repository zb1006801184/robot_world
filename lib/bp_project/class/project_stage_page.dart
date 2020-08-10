import 'package:robot_world/page_index.dart';

class ProjetStagePage extends StatefulWidget {
  @override
  _ProjetStagePageState createState() => _ProjetStagePageState();
}

class _ProjetStagePageState extends State<ProjetStagePage> {
  final controllerStage = TextEditingController();
  final controllerStory = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "项目阶段",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        leading: Text(''),
        backgroundColor: Color(0xFFf4f5f7),
        elevation: 0, //阴影辐射范围
        brightness: Brightness.light,
      ),
      body: GestureDetector(
        child: Stack(
          children: [
            Container(
              width: Global.ksWidth,
              height: Global.ksHeight,
              child: ListView(
                children: [
                  OneLineSelect(
                    titles: "项目当前处于什么阶段",
                    placeholderTitle: "选择项目阶段",
                    controller: controllerStage,
                  ),
                  MuchLineInput(
                    titles: "创业故事",
                    placeholderTitle: "请简单描述创业过程与故事",
                  )
                ],
              ),
            ),
            Positioned(bottom: 12, child: CommitBottomButton("提交", () {
              Map result = {
                    "title": "项目阶段",
                    "map1": {
                      "title": "项目阶段",
                      "list1": ["原创模式样板间市场验证成功"]
                    },
                    "map2": {
                      "title": "创业故事：",
                      "list2": ["数据资产、技术授权为解决者建立一个展示自己真实能力的平台，用自己的闲时对接项目。"]
                    }
                  };
                  Navigator.of(context)
                      .pushNamed("/ResultPage", arguments: result);

            }))
          ],
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
    );
  }
}
