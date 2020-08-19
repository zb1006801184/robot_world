import 'package:dio/dio.dart';
import 'package:robot_world/page_index.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:math';
import '../../model/robot_model.dart';

class NextLatLng {
  final random = Random();

  LatLng getNextLatLng({LatLng center}) {
    center ??= LatLng(39.90960, 116.397228);
    return LatLng(
      center.latitude + random.nextDouble(),
      center.longitude + random.nextDouble(),
    );
  }

  List<LatLng> getNextBatchLatLng(int count) {
    return [
      for (int i = 0; i < count; i++)
        LatLng(
          39.90960 + random.nextDouble() * 4,
          116.397228 + random.nextDouble() * 4,
        )
    ];
  }
}

class RobotWorldHome extends StatefulWidget {
  @override
  _RobotWorldHomeState createState() => _RobotWorldHomeState();
}

class _RobotWorldHomeState extends State<RobotWorldHome>
    with SingleTickerProviderStateMixin {
  @override
  //动画
  Animation<double> animation;
  AnimationController animationController;
  //
  AmapController _controller;
  //机器人B到达的位置
  LatLng lat = LatLng(39.958707425776154, 116.44922317658235);
  //机器人B开始的位置
  LatLng lat1 = LatLng(39.959707425776154, 116.45012317658235);
  //机器人A的位置
  LatLng lat2 = LatLng(39.958707425776154, 116.44912317658235);

  SmoothMoveMarker _moveMarker;

  List<Marker> markers = [];
  List<MarkerOption> markerOptionS = [];
  List<RobotModel> dataList = []; //数据源
  int chatRobotIndexA = 0; //回答机器人
  int chatRobotIndexB = 1; //提问机器人
  Marker markA; //回答机器人的位置
  Marker markB; //提问机器人的位置

  Timer _timer;
  bool showBoxA = true;
  int count = 0;

  final random = Random();

  LatLng getNextLatLng({LatLng center}) {
    center ??= LatLng(39.90960, 116.397228);
    return LatLng(
      center.latitude + random.nextDouble(),
      center.longitude + random.nextDouble(),
    );
  }

  _clickInfo(Marker marker) {
    print(marker.title);
    marker.hideInfoWindow();
  }

  @override
  void initState() {
    super.initState();
  }

  _reuestData() async {
    dataList = await ApiService.getRobotListData({
      "lat": lat2.latitude.toString(),
      "lng": lat2.longitude.toString(),
      "distance": "30000"
    });
    _addAllRobotMark();
    _startMoveRobot();
  }

  //开始移动且移动结束之后对话
  _startMoveRobot() async {
        _controller.clear();
        _addAllRobotMark();
    RobotModel model_A = dataList[chatRobotIndexA];
    RobotModel model_B = dataList[chatRobotIndexB];
    //添加平移
    _moveMarker = await _controller?.addSmoothMoveMarker(
      SmoothMoveMarkerOption(
        path: [
          LatLng(double.parse(model_B.lat), double.parse(model_B.lng)),
          LatLng(double.parse(model_A.lat), double.parse(model_A.lng)),
        ],
        iconProvider: AssetImage("images/robots_icon.png"),
        duration: Duration(seconds: 10),
      ),
    );
    //平移结束
    Future.delayed(
      Duration(seconds: 10),
      () async {
        _controller.clear(keepMyLocation: true);
        _addAllMark(chatRobotIndexB, true);
      },
    ).then((value) async {
      //平移结束开始弹框
      Marker markr;
      Marker markr1;
      _timer = Timer.periodic(Duration(milliseconds: 3000), (t) async {
        showBoxA = !showBoxA;
        if (count >= dataList[chatRobotIndexA].questionVos.length ||
            count == 5) {
          _controller.clearMarkers([markB]);
          _chatEndAndBack();
          return;
        }
        if (showBoxA == false) {
          _controller.clearMarkers([markB]);
          markB = await _controller.addMarker(MarkerOption(
              latLng: LatLng(
                  double.parse(model_A.lat), double.parse(model_A.lng) + 0.001),
              title: model_A.questionVos[count].question,
              infoWindowEnabled: true,
              iconProvider: AssetImage("images/robots_icon.png")));

          markB.showInfoWindow();
          print('展示B,count:$count,title${model_A.questionVos[count].question}');
        } else {
          _controller.clearMarkers([markA]);
          markA = await _controller.addMarker(MarkerOption(
              latLng:
                  LatLng(double.parse(model_A.lat), double.parse(model_A.lng)),
              title: model_A.questionVos[count].answers[0].answer,
              infoWindowEnabled: true,
              iconProvider: AssetImage("images/robots_icon.png")));
          markA.showInfoWindow();
                print('展示A,count:$count,title${model_A.questionVos[count].answers[0].answer}');
                          count++;
        }
      });
    });
  }

  //对话结束，移动回来
  _chatEndAndBack() async {
    RobotModel model_A = dataList[chatRobotIndexA];
    RobotModel model_B = dataList[chatRobotIndexB];
    count = 0;
    _timer.cancel();
    _timer = null;
    showBoxA = true;
    _controller.clear();
    _addAllMark(chatRobotIndexB, false);
    _moveMarker = await _controller?.addSmoothMoveMarker(
      SmoothMoveMarkerOption(
        path: [
          LatLng(double.parse(model_A.lat), double.parse(model_A.lng)),
          LatLng(double.parse(model_B.lat), double.parse(model_B.lng)),
        ],
        iconProvider: AssetImage("images/robots_icon.png"),
        duration: Duration(seconds: 10),
      ),
    );
    Future.delayed(Duration(seconds: 10), () {
      _addAllRobotMark();
      _changeChatRobot();
      _startMoveRobot();
      return "我该返回B机器人了";
    }).then((value) {
      print(value);
    });
  }

  //添加所有机器人
  _addAllRobotMark() async {
    for (RobotModel model in dataList) {
      Marker marker = await _controller.addMarker(MarkerOption(
          latLng: LatLng(double.parse(model.lat), double.parse(model.lng)),
          title: model.robotName,
          infoWindowEnabled: true,
          iconProvider: AssetImage("images/robots_icon.png")));
      markers.add(marker);
    }
  }

  //添加部分机器人
  _addAllMark(int moveIndex, bool isArrive) async {
    RobotModel modelB = dataList[moveIndex];
    RobotModel modelA = dataList[chatRobotIndexA];
    for (RobotModel model in dataList) {
      if (modelB.id != model.id) {
        Marker marker = await _controller.addMarker(MarkerOption(
            latLng: LatLng(double.parse(model.lat), double.parse(model.lng)),
            title: model.robotName,
            infoWindowEnabled: true,
            iconProvider: AssetImage("images/robots_icon.png")));
        if (modelA.id == model.id) {
          markA = marker;
        }
      } else {
        if (isArrive == true) {
          markB = await _controller.addMarker(MarkerOption(
              latLng: LatLng(
                  double.parse(modelA.lat), double.parse(modelA.lng) + 0.001),
              title: model.robotName,
              infoWindowEnabled: true,
              iconProvider: AssetImage("images/robots_icon.png")));
        }
      }
    }
  }

  //机器人对完结束且已经返回
  _changeChatRobot() {
    if (chatRobotIndexB == dataList.length - 1 &&
        chatRobotIndexA < dataList.length) {
      chatRobotIndexA++;
      chatRobotIndexB = 0;
    }
    if (chatRobotIndexB == dataList.length - 1 &&
        chatRobotIndexA == dataList.length - 1) {
      chatRobotIndexA = 0;
      chatRobotIndexB = 0;
    } else {
      chatRobotIndexB++;
    }
  }

//原点
  MarkerOption _mark_option1 = MarkerOption(
      latLng: LatLng(39.958707425776154, 116.44912317658235),
      title: "你好啊！我是机器人A！",
      snippet: "小谛",
      infoWindowEnabled: true,
      iconProvider: AssetImage("images/robots_icon.png"));
  MarkerOption _mark_option2 = MarkerOption(
      latLng: LatLng(39.958707425776154, 116.44922317658235),
      title: "你好啊！我是机器人B！",
      snippet: "小谛",
      infoWindowEnabled: true,
      iconProvider: AssetImage("images/robots_icon.png"));

  MarkerOption getAddMark(String title, LatLng latlng, [String name]) {
    return MarkerOption(
        latLng: latlng,
        title: title,
        snippet: name = null ? "" : name,
        infoWindowEnabled: true,
        iconProvider: AssetImage("images/robots_icon.png"));
  }

  _moveBToA() async {
    //添加平移
    _moveMarker = await _controller?.addSmoothMoveMarker(
      SmoothMoveMarkerOption(
        path: [lat1, lat],
        iconProvider: AssetImage("images/robots_icon.png"),
        duration: Duration(seconds: 10),
      ),
    );
    //平移结束
    Future.delayed(
      Duration(seconds: 10),
      () async {
        _controller.clear(keepMyLocation: true);
        Marker mark1 = await _controller.addMarker(_mark_option1);
        markers.add(mark1);
        Marker mark2 = await _controller.addMarker(_mark_option2);
        markers.add(mark2);
      },
    ).then((value) async {
      //平移结束开始弹框
      Marker markr;
      Marker markr1;
      _timer = Timer.periodic(Duration(milliseconds: 3000), (t) async {
        showBoxA = !showBoxA;
        count++;
        if (count == 5) {
          _controller.clearMarkers([markers[1]]);

          _moveAToB(markr1);

          return;
        }
        if (count > 5) {
          return;
        }
        if (showBoxA == true) {
          _controller.clearMarkers([markr]);
          markr = await _controller
              .addMarker(getAddMark("你好啊,请问你是谁？${count}", lat2));
          markr.showInfoWindow();
        } else {
          _controller.clearMarkers([markr1]);
          markr1 = await _controller
              .addMarker(getAddMark("你好啊，我是机器人啊${count}", lat));
          markr1.showInfoWindow();
        }
      });
    });
  }

  _moveAToB(Marker m) async {
    count = 0;
    _timer.cancel();
    _timer = null;
    _controller.clear();
    _controller.addMarker(_mark_option1);
    _moveMarker = await _controller?.addSmoothMoveMarker(
      SmoothMoveMarkerOption(
        path: [lat, lat1],
        iconProvider: AssetImage("images/robots_icon.png"),
        duration: Duration(seconds: 10),
      ),
    );
    Future.delayed(Duration(seconds: 10), () {
      _controller.clear();
      _controller.addMarker(_mark_option1);
      _moveBToA();
      return "我该返回了";
    }).then((value) {
      print(value);
    });
  }

  _mapCallBack() async {
    //添加mark
    _controller.addMarker(_mark_option1);
    markerOptionS.add(_mark_option1);

    //点击弹窗
    _controller.setInfoWindowClickListener(
      (marker) => _clickInfo(marker),
    );
    //点击mark
    _controller.setMarkerClickedListener((marker) async {
      // await _controller.showCustomInfoWindow(
      //   marker,
      //   Container(
      //     width: 128,
      //     height: 60,
      //     decoration: BoxDecoration(
      //       color: Colors.yellow,
      //       borderRadius: BorderRadius.circular(16),
      //     ),
      //     child: Text("111"),
      //   ),
      // );
    });
    _moveBToA();

    //添加widgetmark
    final marker = await _controller?.addMarkers(
      [
        MarkerOption(
          latLng: getNextLatLng(),
          widget: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Text('使用Widget作为Marker: $i'),
              Image.asset('images/robots_icon.png'),
            ],
          ),
          title: '北京zzzzzzzzzzzzzzzzzzz',
          snippet: '描述',
        )
      ],
    );
    markers.addAll(marker);
    //五秒后自动弹框
    Future.delayed(
      Duration(seconds: 10),
      () => {
        _showBox(markers[0]),
      },
    );
  }

  _showBox(Marker _marker) {
    // _marker.showInfoWindow();
    // _moveMarker.showInfoWindow();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Expanded(
              child: Container(
            child: AmapView(
              mapType: MapType.Standard,
              centerCoordinate: lat,
              showCompass: true,
              showZoomControl: true,
              // showScaleControl: true,
              // zoomGesturesEnabled: false,
              tiltGestureEnabled: false,
              zoomLevel: 15,
              onMarkerClicked: (Marker marker) {
                print(marker.iosModel.get_title());
              },
              onMapClicked: (LatLng coord) {
                print(coord);
              },
              markers: [],
              onMapCreated: (controller) async {
                _controller = controller;
                // _mapCallBack();
                //获取定位权限
                await Permission.locationWhenInUse.request();
                //展示我的位置
                _controller.showMyLocation(MyLocationOption(
                    show: true,
                    fillColor: Color(0xFFFFFF).withOpacity(0),
                    myLocationType: MyLocationType.Locate,
                    iconProvider: AssetImage("images/map_icon_location.png")));
                _reuestData();
              },
              autoRelease: true,
            ),
          )),
        ],
      )
    ]);
  }
}
