//展望提交页
import 'package:robot_world/page_index.dart';

class OutlookPage extends StatefulWidget {
  @override
  _OutlookPageState createState() => _OutlookPageState();
}

class _OutlookPageState extends State<OutlookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBarBase().configAppBar("项目展望"),
      body: Stack(
        children: [
          Container(
            width: Global.ksWidth,
            height: Global.ksHeight,
            child: Column(
              children: [
                MuchLineInput(
                  titles: "展望一下您的项目未来会是什么样子",
                  placeholderTitle: "展望一下您的项目未来会是什么样子",
                )
              ],
            ),
          ),
          Positioned(bottom: 12, child: CommitBottomButton("提交", () {
            Navigator.of(context).pushNamed("/OutlookResultPage");
          }))
        ],
      ),
    );
  }
}
