import '../../../page_index.dart';
import './business_card_detail_page.dart';

class BusinessCardPage extends StatefulWidget {
  @override
  _BusinessCardPageState createState() => _BusinessCardPageState();
}

class _BusinessCardPageState extends State<BusinessCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBarBase().configAppBarRobot("", context),
        backgroundColor: Color(0xFFF6F6F6),
        body: Column(
          children: [
            _buildHeadMessageWidget(),
            _buildSendMessageWidget(),
            Expanded(
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: _buildItemCell(context, index),
                        onTap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context,
                                      Animation animation,
                                      Animation secondaryAnimation) =>
                                  FadeTransition(
                                      opacity: animation,
                                      child: BusinessCardDetailPage())));
                        },
                      );
                    }))
          ],
        ));
  }

  //个人信息
  Widget _buildHeadMessageWidget() {
    return Container(
      height: 113,
      width: Global.ksWidth,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 17, top: 8, right: 17),
            width: 53,
            height: 53,
            child: Image(
              image: AssetImage("images/me.png"),
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "A小白白",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                child: Text(
                  "来源：小R自己的好友",
                  style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                child: Text(
                  "主人：张三",
                  style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                child: Text(
                  "缘分纪念日：2020-7-31",
                  style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  //发送消息
  Widget _buildSendMessageWidget() {
    return GestureDetector(
      child: Container(
        height: 50,
        width: Global.ksWidth,
        margin: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Text(
            "发送消息",
            style: TextStyle(
                color: Global.MAINSTYLECOLOR,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
      onTap: () {
        print("发送消息");
      },
    );
  }

  //列表cell
  Widget _buildItemCell(BuildContext context, int index) {
    return Container(
      // height: 115,
      margin: EdgeInsets.only(left: 17, right: 17, top: 8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.only(left: 12, right: 12),
                  decoration: BoxDecoration(
                    color: Global.MAINSTYLECOLOR,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  height: 44,
                  child: Center(
                    child: Text(
                      "“你叫什么名字”",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  child: Image(
                    image: AssetImage("images/robots_namecard_icon_play.png"),
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          ),
          //lines
          Container(
            height: 1,
            color: Color(0xFFF4F4F4),
            margin: EdgeInsets.only(left: 16, right: 16),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, top: 4, bottom: 16),
            child: Text(
              "已使用1.3万次",
              style: TextStyle(fontSize: 12, color: Color(0xFF999999)),
            ),
          ),
        ],
      ),
    );
  }
}
