import 'package:robot_world/model/user_model.dart';

import '../../../page_index.dart';

class OwnerPage extends StatefulWidget {
  @override
  _OwnerPageState createState() => _OwnerPageState();
}

class _OwnerPageState extends State<OwnerPage> {
  UserModel _userModel;
  @override
  void initState() {
    super.initState();
    _requestUserData();
  }

  _requestUserData() async {
    ApiService.getUserData().then((value) {
      setState(() {
        _userModel = value;
      });
    }).catchError((e){

    });
  }

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
            _buildItem("images/me_list_icon_community.png", "呼麦麦社区"),
            _buildLineMix(),
            _buildItem("images/me_list_icon_settings.png", "设置"),
          ],
        ));
  }

  //个人信息
  Widget _personMessage(BuildContext context) {
    return GestureDetector(
      child: Container(
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
                  margin: EdgeInsets.only(top: 28, left: 16),
                  child: Text(
                    _userModel==null?"zzz":_userModel.username,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 2, left: 16),
                  child: Text(
                    "机器人ID:${_userModel==null?"z123":_userModel.robotId}",
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
    ),
    onTap: (){
      Navigator.of(context).pushNamed("/OwnerMessagePage");
    },
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
      "images/me_icon_order.png",
      "images/me_icon_money.png",
      "images/me_icon_vip.png"
    ];

    return Container(
      height: 117,
      color: Colors.white,
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

//间隔
  Widget _buildLine() {
    return Container(
      height: 10,
      color: Color(0xFFF4F5F7),
      margin: EdgeInsets.only(left: 0, right: 0),
    );
  }
//间隔线
  Widget _buildLineMix(){
    return Container(
      height: 1,
      color: Color(0xFFF4F4F4),
      margin: EdgeInsets.only(left: 61, right: 16),
    );
  }

  //item

  Widget _buildItem(String icon, String title) {
    return GestureDetector(
      child: Container(
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
                  child: Image(image: AssetImage(icon)),
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
    ),
    onTap: (){
      Navigator.of(context).pushNamed("/OwnerSetPage");
    },
    );
  }
}
