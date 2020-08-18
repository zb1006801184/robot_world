import '../../../page_index.dart';

class RobotMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBarBase().configAppBarRobot("大学机器人", context),
        body: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                _buildTopView(),
                _buildLineView(),
                _buildIntroductionView(),
                _buildLineView(),
                _buildMessageView(),
                _buildLineView(),
                _buildPriceView(),
                _buildNoticeView(),
                _buildBottomButton(),
              ],
            ))
          ],
        ));
  }

//顶部背景图
  Widget _buildTopView() {
    return Container(
      width: Global.ksWidth,
      height: 240,
      decoration: BoxDecoration(color: Color(0xFF00BFD8)),
    );
  }

  //间隔
  Widget _buildLineView() {
    return Container(
      width: Global.ksWidth,
      height: 10,
      color: Color(0xFFf6f6f6),
    );
  }

  //简介
  Widget _buildIntroductionView() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 17, bottom: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 17),
            child: Text(
              "简介",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 17, top: 10, right: 17),
            child: Text(
              "这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  //等级 经验等信息
  Widget _buildMessageView() {
    //信息内容
    Widget _itemWidget(String title, String subTitle) {
      return Container(
        margin: EdgeInsets.only(top: 7),
        child: RichText(
            text: TextSpan(
                text: title,
                style: TextStyle(color: Colors.black),
                children: [
              TextSpan(
                  text: subTitle, style: TextStyle(color: Color(0xFF00BFD8)))
            ])),
      );
    }

    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 17, top: 10, bottom: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _itemWidget("需要等级：", "10级"),
          _itemWidget("知识力量：", "450000"),
          _itemWidget("增加经验：", "1090000"),
          Container(
            margin: EdgeInsets.only(top: 7),
            child: Text(
              "主人永久免费使用+更新提醒",
              style: TextStyle(color: Color(0xFF999999)),
            ),
          ),
        ],
      ),
    );
  }

  //价格
  Widget _buildPriceView() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("小R知识喂养包"),
          ),
          Container(
            margin: EdgeInsets.only(top: 7),
            child: RichText(
                text: TextSpan(
                    text: "价格：",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                    children: [
                  TextSpan(
                      text: "59.00R币",
                      style: TextStyle(
                        color: Color(0xFF999999),
                        decoration: TextDecoration.lineThrough,
                        decorationColor: const Color(0xFF999999),
                      )),
                  TextSpan(
                      text: "  39.00R币",
                      style: TextStyle(color: Color(0xFFFF6951))),
                ])),
          ),
        ],
      ),
    );
  }

  //提示
  Widget _buildNoticeView() {
    return Container(
      padding: EdgeInsets.fromLTRB(17, 5, 17, 10),
      child: Text(
        "提示：科普知识喂养包喂给小R之后，小R获取经验后获得拜师资格，拜师成功可以挂机学习，学会后可以参加R世界答题竞赛!",
        strutStyle: StrutStyle(height: 1.5),
        style: TextStyle(
          fontSize: 11,
          color: Color(0xFF999999),
        ),
      ),
    );
  }

  //按钮
  Widget _buildBottomButton() {
    return Container(
        height: 128,
        width: Global.ksWidth,
        child: GestureDetector(
          child: Container(
              margin: EdgeInsets.only(left: 27, right: 27, top: 40, bottom: 40),
              decoration: BoxDecoration(
                  color: Color(0xFF00BFD8),
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              child: Center(
                child: Text(
                  "进入",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              )),
          onTap: () {},
        ));
  }
}
