import 'package:robot_world/page_index.dart';

class FinancingPage extends StatefulWidget {
  @override
  _FinancingPageState createState() => _FinancingPageState();
}

class _FinancingPageState extends State<FinancingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBarBase().configAppBar("融资需求"),
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
                    OneLineInputUnit(
                      titles: "需融资金额",
                      placeholderTitle: "请填写需要融资的金额（单位：万元）",
                      unit: "万元",
                    ),
                    OneLineInputUnit(
                      titles: "意愿出让的股权",
                      placeholderTitle: "请填写意愿出让的股权",
                      unit: "%",
                    ),
                    MuchLineInput(
                      titles: "融资附加条款的其他说明",
                      placeholderTitle: "例如：下一轮优先投资权\n例如：关于3倍退出",
                    ),
                  ],
                )),
          ),
          Positioned(bottom: 12, child: CommitBottomButton("提交", () {
            Map result = {
                    "title": "融资需求",
                    "map1": {
                      "title": "需融资金额：",
                      "list1": ["1000万元"]
                    },
                    "map2": {
                      "title": "意愿出让的股权：",
                      "list2": ["10%"]
                    },
                    "map3": {
                      "title": "融资附加条款的其他说明：",
                      "list3": ["为解决者建立一个展示自己真实能力的平台，用自己的闲时对接项目。"]
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
