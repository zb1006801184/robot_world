import 'package:robot_world/page_index.dart';

class ProjectValuationPage extends StatefulWidget {
  @override
  _ProjectValuationPageState createState() => _ProjectValuationPageState();
}

class _ProjectValuationPageState extends State<ProjectValuationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBarBase().configAppBar("项目估值"),
      body: Stack(
        children: [
          Container(
            width: Global.ksWidth,
            height: Global.ksHeight,
            child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  children: [
                    OneLineInputUnit(titles: "当前项目估值",placeholderTitle: "请填写目前对项目的估值（单位：万元）",unit: "万元",),
                    MuchLineInput(titles: "估值理由",placeholderTitle: "请描述当前估值的理由",),
                  ],
                )),
          ),
          Positioned(bottom: 12, child: CommitBottomButton("提交", () {
            Map result = {
                    "title": "项目估值",
                    "map1": {
                      "title": "当前项目估值：",
                      "list1": ["1000万元"]
                    },
                    "map2": {
                      "title": "估值理由：",
                      "list2": ["为解决者建立一个展示自己真实能力的平台，用自己的闲时对接项目。"]
                    }
                  };
                  Navigator.of(context)
                      .pushNamed("/ResultPage", arguments: result);
          }))
        ],
      ),
    );
  }
}
