import '../../../page_index.dart';

class OwnerMessagePage extends StatefulWidget {
  @override
  _OwnerMessagePageState createState() => _OwnerMessagePageState();
}

class _OwnerMessagePageState extends State<OwnerMessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBarBase().configAppBarRobot("编辑资料", context),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              Container(height: 8),
              _buildItemCell("头像"),
              _buildLine(),
              _buildItemCell("昵称", "嘟嘟"),
              _buildLine(),
              _buildItemCell("生日", "2020-03-03"),
              _buildLine(),
              _buildItemCell("血型", "AB"),
              _buildLine(),
              _buildItemCell("性别", "女"),
            ],
          ))
        ],
      ),
    );
  }

//item  cell

  Widget _buildItemCell(String title, [String subtitle]) {
    return GestureDetector(
      child: Container(
        height: title == "头像" ? 74 : 48,
        width: Global.ksWidth,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text(
                title,
                style: TextStyle(fontSize: 16, color: Color(0xFF333333)),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    child: title == "头像"
                        ? Image(
                            image: AssetImage(
                              "images/me.png",
                            ),
                            width: 42,
                            height: 42,
                            fit: BoxFit.fill,
                          )
                        : Text(
                            subtitle,
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF888888)),
                          ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    width: 8,
                    height: 14,
                    child: Image(
                        image: AssetImage("images/list_icon_goto_gray.png")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        print(title);
      },
    );
  }

  //item line
  Widget _buildLine() {
    return Container(
      color: Colors.white,
      child: Container(
        height: 1,
        margin: EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(color: Color(0xFFF6F6F6)),
      ),
    );
  }


  
}
