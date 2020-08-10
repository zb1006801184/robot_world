import 'package:robot_world/page_index.dart';

class ProfitModelPage extends StatefulWidget {
  @override
  _ProfitModelPageState createState() => _ProfitModelPageState();
}

class _ProfitModelPageState extends State<ProfitModelPage> {
  final controllerProfitDescribe = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "项目盈利模式",
            style: TextStyle(color: Colors.black, fontSize: 16),
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
                child: GestureDetector(
                  child: ListView(
                    children: [
                      MuchLineInput(
                        titles: "关于项目的盈利模式描述",
                        placeholderTitle: "请描述该项目的盈利模式（不超过500字）",
                        controller: controllerProfitDescribe,
                      ),
                      SelectMuchView(
                        title: "请选择该项目的盈利项（多选）",
                        itemList: ["B端用户", "C端用户", "数据资产", "现金流", "流水", "技术授权"],
                        selectItemList: [],
                      ),
                    ],
                  ),
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )),
            Positioned(
                bottom: 12,
                child: CommitBottomButton("提交", () {
                  Map result = {
                    "title": "项目的盈利模式",
                    "map1": {
                      "title": "项目的盈利模式描述：",
                      "list1": ["为解决者建立一个展示自己真实能力的平台，用自己的闲时对接项目。"]
                    },
                    "map2": {
                      "title": "项目盈利项：",
                      "list2": ["数据资产、技术授权"]
                    }
                  };
                  Navigator.of(context)
                      .pushNamed("/ResultPage", arguments: result);
                }))
          ],
        ));
  }
}
