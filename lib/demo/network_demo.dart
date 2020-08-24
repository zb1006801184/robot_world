import 'dart:io';
import 'package:robot_world/page_index.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class NetWorkDemo extends StatefulWidget {
  NetWorkDemo({Key key}) : super(key: key);

  @override
  _NetWorkDemoState createState() => new _NetWorkDemoState();
}

class _NetWorkDemoState extends State<NetWorkDemo> {
  var _ipAddress = 'Unknown';

  _getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    var httpClient = new HttpClient();

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        result = data['origin'];
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _ipAddress = result;
    });
  }

  //简单的post请求
  void _getHttp() async {
    String result;
    try {
      Response response = await Dio().get("https://httpbin.org/ip");
      result = response.data["origin"];
      print(response);
    } catch (e) {
      result = "请求失败";
      print(e);
    }

    setState(() {
      _ipAddress = result;
    });
  }

  void _getLogin() async {
    // Response response = await HttpUtils(headers: {"Authorization":"Basic YXBwOmFwcA==","content-type":"application/x-www-form-urlencoded"}).request(ApiUrl.LOGIN,
    //     data: {'mobile': "15070925726", 'verification_code': "1234"}, method: HttpUtils.POST);
    LoginPerson response = await ApiService.login("15070925726", "1234");
    print("object:"+ "$response");
    
  }

  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 32.0);

    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Your current IP address is:'),
            new Text('$_ipAddress.'),
            spacer,
            new RaisedButton(
              onPressed: _getLogin,
              child: new Text('Get IP address'),
            ),
          ],
        ),
      ),
    );
  }
}
