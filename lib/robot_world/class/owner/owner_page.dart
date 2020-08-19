import '../../../page_index.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class OwnerPage extends StatefulWidget {
  @override
  _OwnerPageState createState() => _OwnerPageState();
}

class _OwnerPageState extends State<OwnerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFFF4F5F7),
        child: ListView(
          children: [
            _personMessage(context),
            _buildLine(),
            _buildMenuIcon(context),
            _buildLine(),
            _buildItem("icon", "呼麦麦社区"),
            _buildItem("icon", "设置"),
          ],
        ));
  }

  //个人信息
  Widget _personMessage(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 104,
      width: Global.ksWidth,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 17),
            height: 70,
            width: 70,
            child: Image(
              image: AssetImage("images/nav_icon_me.png"),
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 17, left: 16),
                  child: Text(
                    "优尼客Robot",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 2, left: 16),
                  child: Text(
                    "机器人ID:5201314",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 2, left: 16),
                  child: Text(
                    "知识量：450000",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
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
            height: 50,
            width: 50,
            margin: EdgeInsets.only(top: 17),
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
    List titles = ["订单", "钱包", "会员"];
    List images = [
      "images/rbtcenter_icon_community.png",
      "images/rbtcenter_icon_send.png",
      "images/rbtcenter_icon_train.png"
    ];

    return Container(
      height: 117,
      color: Colors.white,
      width: Global.ksWidth,
      margin: EdgeInsets.only(top: 10),
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

//间隔线
  Widget _buildLine() {
    return Container(
      height: 10,
      color: Color(0xFFF4F5F7),
      margin: EdgeInsets.only(left: 0, right: 0),
    );
  }

  //item

  Widget _buildItem(String icon, String title) {
    return Container(
      color: Colors.white,
      height: 48,
      width: Global.ksWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 21),
                  height: 24,
                  width: 24,
                  color: Colors.red,
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 17),
            child: Image(
              image: AssetImage("images/list_icon_goto_gray.png"),
              width: 8,
              height: 14,
            ),
          ),
        ],
      ),
    );
  }
}
