import 'package:robot_world/page_index.dart';

class CofounderListPage extends StatefulWidget {
  @override
  _CofounderListPageState createState() => _CofounderListPageState();
}

class _CofounderListPageState extends State<CofounderListPage> {
  List<Widget> _buildListCell(List dataList) {
    List<Widget> result = [];
    for (var item in dataList) {
      result.add(Container(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16,top: 16),
              height: 48,
              width: Global.ksWidth - 16 - 53,
              child: Container(
                margin: EdgeInsets.only(top: 14,left: 15),
                child: Text(item,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
              ),
              decoration: new BoxDecoration(
                color: Color(0xFF1F3ABB),
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
              ),
            ),
            Expanded(child: 
            Container(
              height: 48,
              margin: EdgeInsets.only(top: 16),
              child: Center(
                child: Text("修改",style: TextStyle(color: Color(0xFF0FA2FF),fontSize: 16),),
              ),
            )
            ),
          ],
        ),
      ));
    }
    return result;
  }

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
                          top: Global.ksToolbarHeight +
                              Global.ksStateHeight +
                              16),
                      child: Text("联合创始人简介",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1F3ABB))),
                    ),
                    Expanded(
                      child: ListView(
                        children: _buildListCell(["联合创始人：廖洋", "联合创始人：毛毛"]),
                      ),
                    ),
                  ],
                )),
            Positioned(
                bottom: 12,
                child: ResultBottomButton("添加联合创始人", "下一页", () {}, () {
                  Navigator.of(context).pushNamed("/TeamPage");
                }))
          ],
        ),
      ),
    );
  }
}
