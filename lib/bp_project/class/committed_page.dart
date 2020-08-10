//承诺提交页
import 'package:robot_world/page_index.dart';
class CommittedPage extends StatefulWidget {
  @override
  _CommittedPageState createState() => _CommittedPageState();
}

class _CommittedPageState extends State<CommittedPage> {
  List dataList = [""];

  List <Widget> _buildItem(List data){
    List<Widget> result = [];
    for (var item in data) {
      result.add(
        Container(
          child: Column(
            children: [
              OneLineSelect(titles: "项目正序时间轴",placeholderTitle: "选择年月",),
              MuchLineInput(titles: "",placeholderTitle: "请描述这一时间可以带来的业绩或市场变化",),
            ],
          ),
        )
      );
    }


    result.add(
      GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(top: 16),
                      color: Color(0xFFF4F5F7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image(
                              image: AssetImage("images/profile_icon_add.png"),
                            ),
                          ),
                          Text(
                            " 增加新的时间与承诺",
                            style: TextStyle(
                                color: Color(0xFF0FA2FF), fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {

                      setState(() {
                        dataList.add("");
                      });
                    },
                  )
    );

    result.add(
      Container(
        height: 60,
      )
    );

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBarBase().configAppBar("项目承诺"),
      body: Stack(
        children: [
          Container(
            width: Global.ksWidth,
            height: Global.ksHeight,
            color: Global.BGCOLOR,
            child: MediaQuery.removePadding(
            context: context,
            removeTop: true, 
            child: 
            ListView(
              children: _buildItem(dataList),
            )
            )
          ),
          Positioned(
          bottom: 12,
          child: 
          CommitBottomButton("提交", (){
            Navigator.of(context).pushNamed("/CommittedResultPage");
          })
          )
        ],
      ),
    );
  }
}