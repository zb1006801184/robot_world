import '../../../page_index.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../model/mine_robot_model.dart';
import '../../../model/apply_robot_model.dart';

class RobotCenter extends StatefulWidget {
  @override
  _RobotCenterState createState() => _RobotCenterState();
}

class _RobotCenterState extends State<RobotCenter> {
  //主机器人信息
  MineRobotModel _mineRobotModel;
  //应用机器人列表
  MineApplyRobotModel _applyRobotList;
  //特约机器人
  MineApplyRobotModel _specialRobotModel;

  @override
  void initState() {
    super.initState();
    _requestData();
  }

  _requestData() async {
    //主机器人信息
    ApiService.getMainRobotData().then((value) {
      setState(() {
        _mineRobotModel = value;
      });
    });
    //我的应用机器人
    ApiService.getMineRbotData().then((value) {
      setState(() {
        _applyRobotList = value;
      });
    });
    //我的特约机器人
    ApiService.getSpecialRobot().then((value) {
      setState(() {
        _specialRobotModel = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView(
          children: [
            _personMessage(context),
            _buildIndicator(40),
            _buildLevel(),
            _buildMenuIcon(context),
            _buildHeadTitle("我的应用机器人"),
            Container(
              child: Column(
                children: _buildApplyList(),
              ),
            ),
            _buildHeadTitle("特约机器人"),
            Container(
              child: Column(
                children: _buildSpecialList(),
              ),
            ),
          ],
        ));
  }

  //创建我的应用机器人列表
  List<Widget> _buildApplyList() {
    List<Widget> result = [];
    for (Records model in _applyRobotList?.records ?? []) {
      result.add(_buildSpecialRobot(
          context, "", model?.robotName, model?.subTitle, model?.identity));
      result.add(_buildLine());
    }
    if (result.length > 1) {
      result.removeLast();
    }
    return result.toList();
  }

  //创建特约机器人列表
  List<Widget> _buildSpecialList() {
    List<Widget> result = [];
    for (Records model in _applyRobotList?.records ?? []) {
      result.add(_buildRobotItem(context, "", model.robotName, model.subTitle));
      result.add(_buildLine());
    }
    if (result.length > 1) {
      result.removeLast();
    }
    return result.toList();
  }

  //个人信息
  Widget _personMessage(BuildContext context) {
    return Container(
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
                    _mineRobotModel?.robotName ?? "unknown",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 2, left: 16),
                  child: Text(
                    "机器人ID:${_mineRobotModel?.id ?? "unknown"}",
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

  //进度条
  Widget _buildIndicator(int value) {
    return Container(
      padding: EdgeInsets.only(top: 17, left: 21, right: 21),
      child: StepProgressIndicator(
        totalSteps: 100,
        currentStep: value,
        size: 8,
        padding: 0,
        selectedColor: Colors.cyan,
        unselectedColor: Color(0xFFe8edee),
        roundedEdges: Radius.circular(4),
      ),
    );
  }

  //等级  经验值
  Widget _buildLevel() {
    return Container(
        margin: EdgeInsets.only(top: 8),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17),
              child: RichText(
                  text: TextSpan(
                      text: "当前等级：",
                      style: TextStyle(color: Colors.black),
                      children: [
                    TextSpan(
                        text: "10级", style: TextStyle(color: Color(0xFF00BFD8)))
                  ])),
            ),
            Container(
              margin: EdgeInsets.only(left: 30),
              child: RichText(
                  text: TextSpan(
                      text: "经验值：",
                      style: TextStyle(color: Colors.black),
                      children: [
                    TextSpan(
                        text: "10086",
                        style: TextStyle(color: Color(0xFF00BFD8)))
                  ])),
            ),
          ],
        ));
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
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // _buildIcon(titles[0], images[0]),
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
              child: Container(
                color: Colors.red,
                width: 44,
                height: 44,
              ),
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

//特约机器人/我的机器人
  Widget _buildSpecialRobot(
      BuildContext context, String imageStr, String title, String subTitle,
      [int id]) {
    //右侧按钮
    Widget _button() {
      if (id != null) {
        return Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Container(
            width: 81,
            height: 30,
            decoration: new BoxDecoration(
              color: Color(0xFF00BFD8),
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            child: Center(
              child: Text(
                "开始训练",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      }
      return Container();
    }

    //中间是否拥有的状态
    Widget _robotState() {
      if (id != null) {
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
              child: Container(
                width: 44,
                height: 44,
                child: Image(
                    image: AssetImage(id == 3
                        ? "images/logo_icon.png"
                        : "images/logo_icon_t.png")),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      _robotState(),
                    ],
                  )),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      subTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Color(0xFFAEAFB7)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _button(),
        ],
      ),
    );
  }
}
