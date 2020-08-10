//项目承诺结果页
import 'package:robot_world/page_index.dart';

class CommittedResultPage extends StatefulWidget {
  @override
  _CommittedResultPageState createState() => _CommittedResultPageState();
}

class _CommittedResultPageState extends State<CommittedResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Global.ksWidth,
        height: Global.ksHeight,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("images/bg_pic_top.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              width: Global.ksWidth,
              height: Global.ksHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 16,
                        top:
                            Global.ksToolbarHeight + Global.ksStateHeight + 16),
                    child: Text("项目承诺",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1F3ABB))),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 12,
                child: ResultBottomButton("修改", "下一页", () {}, () {
                  Navigator.of(context).pushNamed("/OutlookPage");
                }))
          ],
        ),
      ),
    );
  }
}
