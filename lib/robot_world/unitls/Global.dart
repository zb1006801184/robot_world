import 'package:robot_world/page_index.dart';
import 'dart:ui';
import 'dart:convert';

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Global {
  //背景色
  static const BGCOLOR = Color(0xFFf4f5f7);
  //按钮背景色
  static const BUTTONBGCOLOR = Color(0xFF1F3ABB);
  //主体风格颜色
  static const MAINSTYLECOLOR = Color(0xFF00BFD8);

  static SharedPreferences _prefs;
  static LoginPerson profile = LoginPerson();
  static FormDataModel fromModel = FormDataModel();


  // 可选的主题列表
  static List<MaterialColor> get themes => _themes;

  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");
  static bool loginState;
  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    loginState = _prefs.getBool(DataName.LOGINSTATE);
    if (loginState != null && loginState == true) {
      print("已登录");
    } else {
      print("未登录");
    }
    var _profile = _prefs.getString(DataName.PERSONINFO);
    if (_profile != null) {
      try {
        profile = LoginPerson.fromJson(jsonDecode(_profile));
      } catch (e) {
        print(e);
      }
    }
  }

//设备宽高
  static double ksWidth = _width;
  static double ksHeight = _height;
//导航栏的高度
  static double ksToolbarHeight = kToolbarHeight;
//状态栏高度
  static double ksStateHeight = MediaQueryData.fromWindow(window).padding.top;
  static double ksBottomBar = kBottomNavigationBarHeight;


  static double get _width {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
    return mediaQuery.size.width;
  }

  static double get _height {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
    return mediaQuery.size.height;
  }

}
