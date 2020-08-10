import 'package:robot_world/page_index.dart';

class ProjectModelPage extends StatefulWidget {
  @override
  _ProjectModelPageState createState() => _ProjectModelPageState();
}

class _ProjectModelPageState extends State<ProjectModelPage> {
  final controllerModelDescribe = TextEditingController();
  final controllerLink = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "项目模式概述",
          style: TextStyle(color: Colors.black),
        ),
        leading: Text(''),
        backgroundColor: Color(0xFFf4f5f7),
        elevation: 0, //阴影辐射范围
        brightness: Brightness.light,
      ),
      body: Stack(
        children: [
          Container(
            width: Global.ksWidth,
            height: Global.ksHeight,
            child: Scrollbar(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  MuchLineInput(
                    titles: "关于项目的模式创新描述",
                    placeholderTitle: "请描述该项目的模式创新（不超过500字）",
                    controller: controllerModelDescribe,
                  ),
                  OneLineInput(
                    titles: "互联网演示地址",
                    placeholderTitle: "http://",
                    controller: controllerLink,
                  ),
                  SelectImageView(
                    title: "产品截图（最多9张）",
                  ),
                ],
              ),
            )),
          ),
          Positioned(
            bottom: 12,
            child: CommitBottomButton("提交", () {
              Navigator.of(context).pushNamed("/ProjectModelResultPage");
            }),
          )
        ],
      ),
    );
  }
}
