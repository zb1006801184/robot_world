import 'package:robot_world/page_index.dart';

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBarBase().configAppBar("项目团队介绍"),
      body: Stack(
        children: [
          Container(
            width: Global.ksWidth,
            height: Global.ksHeight,
            child: ListView(
              children: [
                SelectImageView(title: "团队合影照",),
                MuchLineInput(titles: "团队成员介绍",placeholderTitle: "请简单描述团队的成员",),
              ],
            ),
          ),
          Positioned(bottom: 12, child: CommitBottomButton("提交", () {
            Navigator.of(context).pushNamed("/TeamResultPage");
          }))
        ],
      ),
    );
  }
}
