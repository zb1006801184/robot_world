import 'package:robot_world/page_index.dart';

class TalentPage extends StatefulWidget {
  @override
  _TalentPageState createState() => _TalentPageState();
}

class _TalentPageState extends State<TalentPage> {
  List itemList = [
    "融资计划书制作",
    "团队组建规模建议",
    "技术专利保护建议",
    "法律顾问",
    "IT技术顾问",
    "IT产品顾问",
    "渠道资源",
    "大咖站台",
    "资质办理",
    "创业辅导：如何避免死亡之坑"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBarBase().configAppBar("融智需求"),
      body: Stack(
        children: [
          Container(
            width: Global.ksWidth,
            height: Global.ksHeight,
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  children: [
                    SelectMuchView(
                      title: "您的团队与项目还需要什么智慧支持（多选）",
                      itemList: itemList,
                      selectItemList: [],
                    ),
                    MuchLineInput(titles: "创业融智需求描述",placeholderTitle: "例如：自己的困惑与问题",),
                    Container(
                      height: 60,
                    ),
                  ],
                )),
          ),
          Positioned(bottom: 12, child: CommitBottomButton("提交", () {
            Map result = {
                    "title": "融智需求",
                    "map1": {
                      "title": "我的团队与项目还需要什么智慧支持：",
                      "list1": ["技术专利保护建议、IT产品顾问、渠道资源、创业辅导：如何避免死亡之坑"]
                    },
                    "map2": {
                      "title": "创业融智需求描述：",
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
