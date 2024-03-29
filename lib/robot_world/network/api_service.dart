import 'package:robot_world/bp_project/models/form_data_model.dart';
import 'package:robot_world/bp_project/models/from_list_model.dart';
import 'http_utils.dart';
import 'api_url.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:robot_world/page_index.dart';
import '../../model/robot_model.dart';
import '../../model/mine_robot_model.dart';
import '../../model/apply_robot_model.dart';
import '../../model/user_model.dart';
class ApiService {
//登录
  static Future<LoginPerson> login(
      String username, String verification_code) async {
    Response response = await HttpUtils(headers: {
      "Authorization": "Basic YXBwOmFwcA=="
    }).request(
        "${ApiUrl.LOGIN}?mobile=${username}&verification_code=${verification_code}",
        method: HttpUtils.POST);
    if (response != null) {
      var responseData = jsonDecode(response.data);
      LoginPerson data = LoginPerson.fromJson(responseData["datas"]);
      return data;
    } else {
      return null;
    }
  }

//获取所有项目列表
  static Future<List<FormListModel>> getAllFromData() async {
    Response response = await HttpUtils(
            headers: {"Authorization": "Bearer ${Global.profile.accessToken}"})
        .request(ApiUrl.ALL_FROM, method: HttpUtils.GET);
    if (response != null) {
      var responseData = jsonDecode(response.data);
      List listData = responseData["data"];
      List data = [];
      if (listData == null) {
        return null;
      }
      return List()
        ..addAll((listData ?? []).map((o) => FormListModel.fromJson(o)));
    } else {
      return null;
    }
  }

  //提交列表
  static Future<FormDataModel> subCommitAllFromData(Map params) async {
    Response response = await HttpUtils(headers: {
      "Authorization": "Bearer ${Global.profile.accessToken}",
      "Content-type": "application/json"
    }).request(ApiUrl.SAVE_FORM, method: HttpUtils.POST, data: params);
    if (response != null) {
      var responseData = jsonDecode(response.data);
      var mapData = responseData["data"];
      if (mapData.length == null) {
        return null;
      }
      return FormDataModel.fromJson(mapData);
    } else {
      return null;
    }
  }

  //机器人列表
  static Future<List<RobotModel>> getRobotListData(
      Map<String, dynamic> params) async {
    Response response = await HttpUtils(
            // headers: {"Authorization": "Bearer ${Global.profile.accessToken}","Content-type":"application/json"}
            )
        .request(ApiUrl.ROBOT_LIST, method: HttpUtils.GET, data: params);
    if (response != null) {
      var responseData = jsonDecode(response.data);
      List listData = responseData["datas"];
      List data = [];
      if (listData == null) {
        return null;
      }
      return List()
        ..addAll((listData ?? []).map((o) => RobotModel.fromJson(o)));
    } else {
      return null;
    }
  }

//获取机器人信息
  static Future<MineRobotModel> getMainRobotData() async {
    Response response = await HttpUtils(headers: {
      "Authorization": "Bearer ${Global.profile.accessToken}",
      "Content-type": "application/json"
    }).request(ApiUrl.MAIN_ROBOT_MESSAGE, method: HttpUtils.GET, data: null);

    if (response != null) {
      var responseData = jsonDecode(response.data);
      MineRobotModel data = MineRobotModel.fromJson(responseData["data"]);
      return data;
    } else {
      return null;
    }
  }

  //获取我的应用机器人
  static Future<MineApplyRobotModel> getMineRbotData() async {
    Response response = await HttpUtils(headers: {
      "Authorization": "Bearer ${Global.profile.accessToken}",
      "Content-type": "application/json"
    }).request(ApiUrl.MINE_ROBOT, method: HttpUtils.GET, data: null);
    if (response != null) {
      var responseData = jsonDecode(response.data);
      MineApplyRobotModel data = MineApplyRobotModel.fromJson(responseData["data"]);
      return data;
    } else {
      return null;
    }
  }

  //获取我的特约机器人
  static Future<MineApplyRobotModel> getSpecialRobot() async {
    Response response = await HttpUtils(headers: {
      "Authorization": "Bearer ${Global.profile.accessToken}",
      "Content-type": "application/json"
    }).request(ApiUrl.MINE_SPECIAL_ROBOT, method: HttpUtils.GET, data: null);

    if (response != null) {
      var responseData = jsonDecode(response.data);
      MineApplyRobotModel data = MineApplyRobotModel.fromJson(responseData["data"]);
      return data;
    } else {
      return null;
    }
  }

  //获取用户信息
  static Future<UserModel> getUserData() async {
    Response response = await HttpUtils(headers: {
      "Authorization": "Bearer ${Global.profile.accessToken}",
      "Content-type": "application/json"
    }).request(ApiUrl.MINE_MESSAGE, method: HttpUtils.GET, data: null);

    if (response != null) {
      var responseData = jsonDecode(response.data);
      UserModel data = UserModel.fromJson(responseData["data"]);
      return data;
    } else {
      return null;
    }
  }

}
