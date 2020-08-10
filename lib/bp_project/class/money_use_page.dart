import 'package:robot_world/page_index.dart';

class MoneyUsePage extends StatefulWidget {
  @override
  _MoneyUsePageState createState() => _MoneyUsePageState();
}

class _MoneyUsePageState extends State<MoneyUsePage> {
  List itemList = [
    "换办公室",
    "购买设备",
    "购买专利",
    "招募人才",
    "增加注册资金",
    "渠道拓展",
    "广告费用",
    "收购团队",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBarBase().configAppBar("融资使用计划"),
      body: Stack(
        children: [
          Container(
            width: Global.ksWidth,
            height: Global.ksHeight,
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(children: [
                  SelectMuchView(
                    title: "您的团队融资成功后的资金使用计划是什么（多选）",
                    itemList: itemList,
                    selectItemList: [],
                  ),
                  MuchLineInput(
                    titles: "资金使用计划",
                    placeholderTitle: "简单说明资金使用计划",
                  ),
                  Container(
                    height: 60,
                  ),
                ])),
          ),
          Positioned(
              bottom: 12,
              child: CommitBottomButton("提交", () {
                Map result = {
                  "title": "融资使用计划",
                  "map1": {
                    "title": "我的团队融资成功后的资金使用计划是什么：",
                    "list1": ["换办公室、招募人才"]
                  },
                  "map2": {
                    "title": "资金使用计划：",
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
