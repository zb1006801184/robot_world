import '../../../page_index.dart';

class OwnerSetPage extends StatefulWidget {
  @override
  _OwnerSetPageState createState() => _OwnerSetPageState();
}

class _OwnerSetPageState extends State<OwnerSetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBarBase().configAppBarRobot("设置", context),
      body: GestureDetector(
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20, left: 16, right: 16),
                  height: 48,
                  decoration: BoxDecoration(
                      color: Global.MAINSTYLECOLOR,
                      borderRadius: BorderRadius.circular(4)),
                  child: Center(
                    child: Text(
                      "退出登录",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
        onTap: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool(DataName.LOGINSTATE, false);
          Navigator.of(context).pushNamedAndRemoveUntil(
              "/Login", ModalRoute.withName("/Login"));
        },
      ),
    );
  }
}
