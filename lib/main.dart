import 'package:flutter/material.dart';
import 'package:robot_world/robot_world/unitls/sp_util.dart';
import 'routes.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'package:robot_world/page_index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/i18n.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';

// import 'package:flutter_i18n/flutter_i18n.dart';
void main() async {
  //确保初始化
  WidgetsFlutterBinding.ensureInitialized();

  //初始化本地持久化对象
  await SpUtil.getInstance();

  //全局常量初始化 /app入口
  Global.init().then((e) {
    debugPaintSizeEnabled = false; //调试模式

    runApp(Store.init(child: MyApp()));

    SystemUiOverlayStyle style = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light);

    SystemChrome.setSystemUIOverlayStyle(style);
  });
  //初始化地图
  await AmapService.init(
    iosKey: 'cbe00823663a07e543d2d54430432272',
    androidKey: 'c91e45151b799ec4bd6f73508e7d28ea',
  );
  //初始化定位
  await AmapCore.init('cbe00823663a07e543d2d54430432272');

  await enableFluttifyLog(false);

  // 自定义报错页面
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    debugPrint(flutterErrorDetails.toString());
    return new Center(child: new Text("App错误，快去看看报错信息吧!"));
  };

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      initialRoute: '/MainRoute',
      onGenerateRoute: onGenerateRoute,
      routes: routes,
      debugShowCheckedModeBanner: true, //debug标识
      navigatorKey: NavKey.navKey,
      localizationsDelegates: [
        S.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      // localeResolutionCallback: S.delegate.resolution(),//fallback: Locale("zh","CN")
    );
  }
}
