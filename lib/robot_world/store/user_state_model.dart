import 'dart:convert';
import '../unitls/sp_util.dart';
import 'package:robot_world/page_index.dart';
class UserStateModel extends ChangeNotifier {
  //    notifyListeners(); 刷新ui
  //是否登录
  bool isLogin() {
    bool isLogin = SpUtil.getBool(DataName.LOGINSTATE, defValue: false);
    return isLogin;
  }

  //保存登录信息
  savaUserInfo(LoginPerson model) async {
    String data = jsonEncode(model.toJson());
    //保存登录状态
    SpUtil.setBool(DataName.LOGINSTATE, true);
    //保存登录信息
    SpUtil.setString(DataName.PERSONINFO, data);
    Global.profile = model;
  }
}
