
import 'package:flutter/material.dart';
import 'package:robot_world/robot_world/unitls/data_name_unitls.dart';
import '../unitls/sp_util.dart';
class UserStateModel extends ChangeNotifier {
  //是否登录
  bool isLogin() {
    bool isLogin = SpUtil.getBool(DataName.LOGINSTATE, defValue: false);
    return isLogin;
  }
  

}