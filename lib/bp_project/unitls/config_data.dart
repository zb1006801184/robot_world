import 'package:robot_world/bp_project/models/form_data_model.dart';
class ConfigData {
  Map configResult(FormDataModel model, String title) {
    Map result = {};
    if (title == "痛点解决描述") {
      List list1 = [];
      List list2 = [];
      Map map1 = {};
      Map map2 = {};
      list1.add(model.painDescribe);
      list1.add(model.painOtherScheme);
      map1["title"] = "项目解决了什么痛点：";
      map1["list1"] = list1;
      String temStr ;
      model.painProjectScheme.forEach((element) {
        if (temStr == null) {
          temStr = element;
        } else {
          temStr = "${temStr}、${element}";
        }
      });
      list2.add(temStr);
      list2.add(model.painProjectSchemeDescribe);
      map2["title"] = "用什么方法解决这个痛点：";
      map2["list2"] = list2;

      result["title"] = title;
      result["map1"] = map1;
      result["map2"] = map2;
    }
    return result;
  }
}
