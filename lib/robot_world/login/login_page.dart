//登录
import 'dart:convert';

import 'package:robot_world/page_index.dart';
import 'package:robot_world/robot_world/store/user_state_model.dart';
import 'dart:ui';

import 'package:robot_world/robot_world/unitls/sp_util.dart';

class LoginPageView extends StatelessWidget {
  _getLogin(context) async {
    LoginPerson response = await ApiService.login("15070925726", "1234");
    if (response != null) {
      Store.value<UserStateModel>(context,listen: false).savaUserInfo(response);
      Navigator.pushNamed(context, "/MainRoute");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InkWell(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //顶部
            Container(
              margin: EdgeInsets.only(top: 20),
              height: Global.ksToolbarHeight + Global.ksStateHeight,
              child: IconButton(
                icon: Image.asset('images/nav_icon_close.png'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            //标题
            Container(
              margin: EdgeInsets.only(left: 16, top: 12),
              child: Text(
                "手机登录",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
            ),
            //电话输入框
            Container(
              margin: EdgeInsets.only(top: 54),
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 240,
                    height: 40,
                    child: TextField(
                      style: TextStyle(fontSize: 18),
                      keyboardType: TextInputType.number,
                      showCursor: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 1),
                          hintStyle:
                              TextStyle(color: Color(0xFFAEAFB7), fontSize: 18),
                          hintText: '请输入手机号'),
                    ),
                  ),
                  Image(
                    image: AssetImage("images/signin_icon_del.png"),
                    width: 16,
                    height: 16,
                  ),
                ],
              ),
            ),
            //line
            Container(
              height: 1,
              margin: EdgeInsets.only(left: 16, right: 16, top: 0),
              color: Color(0xFFE4E4E4),
            ),
            //输入验证码
            Container(
              margin: EdgeInsets.only(top: 23.5),
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 240,
                    height: 40,
                    child: TextField(
                      style: TextStyle(fontSize: 18),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: -1),
                          hintStyle:
                              TextStyle(color: Color(0xFFAEAFB7), fontSize: 18),
                          hintText: '请输入验证码'),
                    ),
                  ),
                  Text(
                    "发送验证码",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFF7D00)),
                  )
                ],
              ),
            ),
            //line
            Container(
              height: 1,
              margin: EdgeInsets.only(left: 16, right: 16, top: 0),
              color: Color(0xFFE4E4E4),
            ),
            //登录按钮
            Container(
              margin: EdgeInsets.only(top: 48.5, left: 16, right: 16),
              width: Global.ksWidth,
              height: 48,
              color: const Color(0xFFF4F5F7),
              child: FlatButton(
                color: Global.MAINSTYLECOLOR,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text(
                  "登录",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0)),
                onPressed: () {
                  _getLogin(context);
                },
              ),
            ),
            Center(
              child: Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "* 注册即代表你已阅读并同意",
                        style: TextStyle(fontSize: 12),
                      ),
                      InkWell(
                        child: Text(
                          "用户协议",
                          style: TextStyle(fontSize: 12, color: Colors.blue),
                        ),
                        onTap: () {
                          print("用户协议");
                        },
                      ),
                      Text(
                        "和",
                        style: TextStyle(fontSize: 12),
                      ),
                      InkWell(
                        child: Text(
                          "管理规范",
                          style: TextStyle(fontSize: 12, color: Colors.blue),
                        ),
                        onTap: () {
                          print("管理规范");
                        },
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
    ));
  }
}
