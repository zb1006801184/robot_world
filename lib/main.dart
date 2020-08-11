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
  
  
  Global.init().then((e) {
    debugPaintSizeEnabled = false; //调试模式
    if (Global.loginState == null || Global.loginState == false) {
      runApp(Login());
    } else {
      runApp(MyApp());
    }
    // runApp(TestDemo());
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  });
WidgetsFlutterBinding.ensureInitialized();
  await enableFluttifyLog(false);
  await AmapService.instance.init(
    iosKey: 'cbe00823663a07e543d2d54430432272',
    androidKey: '7c9daac55e90a439f7b4304b465297fa',
    webApiKey: 'e69c6fddf6ccf8de917f5990deaa9aa2',
  );
  await AmapCore.init('cbe00823663a07e543d2d54430432272');
  

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
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      initialRoute: '/Login',
      routes: routes,
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: true,
    );
  }
}
