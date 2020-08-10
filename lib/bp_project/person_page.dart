import 'package:robot_world/bp_project/models/from_list_model.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:english_words/english_words.dart'; //随机生成单纯的库
import 'ui/person_item.dart';
import 'package:robot_world/page_index.dart';
import 'package:flutter/scheduler.dart';

class Person extends StatefulWidget {
  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  var _words = <FormListModel>[];
  var argument;
//新建bp
  _creatProject(context) {
    Navigator.pushNamed(context, "/TitlePage");
  }

  @override
  void initState() {
    super.initState();
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

    SchedulerBinding.instance.addPostFrameCallback((_) => {
          _requestAllData(),
        });
  }

  _showMessage(Map argument) {
    if (argument == null) {
      return;
    }
    if (argument["type"] == "end") {
      ToastView().showAccomplish(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    argument = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          //头部视图
          Container(
            color: Colors.white,
            constraints: BoxConstraints.tightFor(
                width: Global.ksWidth,
                height:
                    92 + Global.ksStateHeight + Global.ksToolbarHeight), //卡片大小
            child: Column(
              children: <Widget>[
                //设置
                Container(
                    color: Colors.white,
                    constraints: BoxConstraints.tightFor(
                        width: Global.ksWidth,
                        height: Global.ksStateHeight + Global.ksToolbarHeight),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.settings),
                          onPressed: () {
                            print("点击设置${Global.ksWidth} zz");
                            ToastView().showLoading(context);
                          },
                        ),
                      ],
                    )),
                //个人信息
                InkWell(
                  child: Container(
                    constraints: BoxConstraints.tightForFinite(
                        width: Global.ksWidth, height: 92),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              //头像
                              Container(
                                constraints:
                                    BoxConstraints.tightFor(height: 72),
                                margin: EdgeInsets.only(left: 16, top: 0),
                                // color: Colors.red,
                                decoration: BoxDecoration(
                                  // color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(36.0),
                                  ),
                                ),
                                child: Image(
                                  image:
                                      AssetImage("images/home_pic_start.png"),
                                  width: 72,
                                  height: 72,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              //电话
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Text(
                                  "18802013843",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    height: 1,
                                    fontFamily: "PingFangSC-Medium",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ]),
                        Container(
                          constraints:
                              BoxConstraints.tightFor(height: 72, width: 32),
                          padding: EdgeInsets.only(right: 16),
                          child: Container(
                            child: Image(
                              image:
                                  AssetImage("images/list_icon_goto_gray.png"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () => {print("点击了个人信息")}, //点击
                )
              ],
            ),
          ),
          //listView
          Container(
            height: Global.ksHeight -
                Global.ksStateHeight -
                Global.ksToolbarHeight -
                92 -
                63,
            color: const Color(0xFFF4F5F7),
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                  itemCount: _words.length,
                  itemExtent: 128.0,
                  itemBuilder: (BuildContext context, int index) {
                    return PersonItem(
                        _words,
                        index,
                        () => {
                              Fluttertoast.showToast(
                                  msg: "点击了第" + "  $index" + "  cell",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                  webBgColor:
                                      "linear-gradient(to right, #2A2A2A, #2A2A2A)",
                                  webPosition: "center"),
                            });
                  }),
            ),
          ),
          //底部按钮
          Container(
            width: Global.ksWidth - 32,
            height: 48,
            color: const Color(0xFFF4F5F7),
            child: FlatButton(
              color: Color(0xFF1F3ABB),
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text(
                "新建BP项目",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
              onPressed: () {
                _creatProject(context);
              },
            ),
          )
        ],
      ),
    );
  }

  void _requestAllData() async {
    ToastView().showLoading(context);
    List<FormListModel> respone = await ApiService.getAllFromData();
    if (respone == null) {
      return;
    }
    setState(() {
      _words = respone;
      ToastView().dismissLoading(context);
    });
    _showMessage(argument);
  }
}
