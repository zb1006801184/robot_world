import '../page_index.dart';

class RobotCenter extends StatefulWidget {
  @override
  _RobotCenterState createState() => _RobotCenterState();
}

class _RobotCenterState extends State<RobotCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBarBase().configAppBarRobot("机器人中心", context),
        body: Container(
            color: Colors.white,
            child: ListView(
              children: [
                _personMessage(context),
                _buildMenuIcon(context),
                _buildHeadTitle("我的应用机器人"),
                _buildSpecialRobot(context, "", "解决者地图", "帮助有能力凭借自身能力完…"),
                _buildLine(),
                _buildSpecialRobot(context, "", "智慧商圈", "让您了解身边商圈的点点滴滴"),
                _buildLine(),
                _buildHeadTitle("特约机器人"),
                _buildRobotItem(context, "", "养生知识机器人", "回答您关于养生的科普知识"),
                _buildLine(),
                _buildRobotItem(context, "", "高考报名机器人", "根据您所在省份、分数和打算报考的方向…"),
                _buildLine(),
                _buildRobotItem(context, "", "在线小说机器人", "根据您喜欢看的分类为您推送最新的火热小…"),
                _buildLine(),
              ],
            )));
  }

  //个人信息
  Widget _personMessage(BuildContext context) {
    return Container(
      height: 100,
      width: Global.ksWidth,
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.only(left: 16),
              height: 76,
              width: 76,
              child: Image(image: AssetImage("images/nav_icon_me.png"),fit: BoxFit.fill,),
              ),
          Expanded(
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 16, left: 16),
                  child: Text(
                    "优尼客Robot",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16, left: 16),
                  child: Text(
                    "机器人ID:5201314",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          )),
          Container(
            margin: EdgeInsets.only(right: 16),
            child: Image(
              image: AssetImage("images/list_icon_goto_gray.png"),
              width: 8,
              height: 14,
            ),
          )
        ],
      ),
    );
  }

  //菜单icon
  Widget _buildIcon(String title, String imageStr) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 52,
            width: 52,
            margin: EdgeInsets.only(top: 12),
            child: Image(image: AssetImage(imageStr)),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(title),
          )
        ],
      ),
    );
  }

  Widget _buildMenuIcon(BuildContext context) {
    List titles = ["进入社区", "派出机器人", "训练机器人"];
    List images = [
      "images/rbtcenter_icon_community.png",
      "images/rbtcenter_icon_send.png",
      "images/rbtcenter_icon_train.png"
    ];

    return Container(
      height: 102,
      width: Global.ksWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIcon(titles[0], images[0]),
          _buildIcon(titles[1], images[1]),
          _buildIcon(titles[2], images[2]),
        ],
      ),
    );
  }

  //标题header
  Widget _buildHeadTitle(String title) {
    return Container(
      height: 38,
      width: Global.ksWidth,
      color: Color(0xFFF4F5F7),
      padding: EdgeInsets.only(left: 16, top: 14),
      child: Text(
        title,
        style: TextStyle(fontSize: 14),
      ),
    );
  }

//线
  Widget _buildLine() {
    return Container(
      height: 1,
      color: Color(0xFFE4E4E4),
      margin: EdgeInsets.only(left: 76, right: 16),
    );
  }

//特约机器人item
  Widget _buildRobotItem(
      BuildContext context, String imageStr, String title, String subTitle) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 76,
            height: 76,
            child: Center(
              child: Container(color: Colors.red,width: 44,height: 44,),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    subTitle,
                    style: TextStyle(color: Color(0xFFAEAFB7)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
//特约机器人

  Widget _buildSpecialRobot(
      BuildContext context, String imageStr, String title, String subTitle) {
    Widget _button() {
      if (title == "解决者地图") {
        return Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Container(
            width: 81,
            height: 30,
            decoration: new BoxDecoration(
            color: Color(0xFF5277FF),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
            child: Center(
              child: Text("开始训练",style: TextStyle(color: Colors.white),),
            ),
          ),
        );
      }
      return Container();
    }

    Widget _robotState() {
      if (title == "解决者地图") {
        return Container(
          margin: EdgeInsets.only(left: 8),
          padding: EdgeInsets.only(left: 6, top: 3, bottom: 3, right: 3),
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            border: new Border.all(width: 1, color: Color(0xFF00B057)),
          ),
          child: Text(
            "已拥有",
            style: TextStyle(fontSize: 12, color: Color(0xFFFF00B057)),
          ),
        );
      }
      return Container(
        margin: EdgeInsets.only(left: 8),
        padding: EdgeInsets.only(left: 6, top: 3, bottom: 3, right: 3),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          border: new Border.all(width: 1, color: Color(0xFFAEAFB7)),
        ),
        child: Text(
          "未拥有",
          style: TextStyle(fontSize: 12, color: Color(0xFFAEAFB7)),
        ),
      );
    }

    return Container(
      child: Row(
        children: [
          Container(
            width: 76,
            height: 76,
            child: Center(
              child: Container(color: Colors.red,width: 44,height: 44,),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: Row(
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    _robotState(),
                  ],
                )),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    subTitle,
                    style: TextStyle(color: Color(0xFFAEAFB7)),
                  ),
                ),
              ],
            ),
          ),
          _button(),
        ],
      ),
    );
  }
}