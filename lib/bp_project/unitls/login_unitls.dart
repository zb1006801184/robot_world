import 'package:robot_world/page_index.dart';

class LoginUnitls {
  //获取登录状态
  static Future<bool> getState() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    bool loginState = prefs.getBool(DataName.LOGINSTATE);
    if (loginState) {
      return loginState;
    }
    return false;
  }

//保存登录状态
 static Future<void> setState() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setBool(DataName.LOGINSTATE, true);
  }
}
