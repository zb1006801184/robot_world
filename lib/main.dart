import 'package:flutter/material.dart';
import 'routes.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'package:robot_world/page_index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/i18n.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';

// import 'package:flutter_i18n/flutter_i18n.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((e) {
    debugPaintSizeEnabled = false; //调试模式
    runApp(MyApp());
    // runApp(TestDemo()); //国际化  
    SystemUiOverlayStyle style = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(style);
  });
  await AmapService.init(
    iosKey: 'cbe00823663a07e543d2d54430432272',
    androidKey: 'c91e45151b799ec4bd6f73508e7d28ea',
  );
  await AmapCore.init('cbe00823663a07e543d2d54430432272');
  await enableFluttifyLog(false);
}

class TestDemo extends StatefulWidget {
  @override
  _TestDemoState createState() => new _TestDemoState();
}

class _TestDemoState extends State<TestDemo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Locale myLocale = Localizations.localeOf(context);

    return new MaterialApp(
      // App名字
      title: 'robot_world',
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
      routes: routes,
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
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
    );
  }
}
