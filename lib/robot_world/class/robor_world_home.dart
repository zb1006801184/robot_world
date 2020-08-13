import 'package:robot_world/page_index.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:math';

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

//原点
  MarkerOption _mark_option1 = MarkerOption(
      latLng: LatLng(39.958707425776154, 116.44912317658235),
      title: "你好啊！我是机器人A！",
      snippet: "小谛",
      infoWindowEnabled: true,
      iconProvider: AssetImage("images/me.png"));
  MarkerOption _mark_option2 = MarkerOption(
      latLng: LatLng(39.958707425776154, 116.44922317658235),
      title: "你好啊！我是机器人B！",
      snippet: "小谛",
      infoWindowEnabled: true,
      iconProvider: AssetImage("images/me.png"));

  MarkerOption getAddMark(String title, LatLng latlng) {
    return MarkerOption(
        latLng: latlng,
        title: title,
        snippet: "小谛",
        infoWindowEnabled: true,
        iconProvider: AssetImage("images/me.png"));
  }

  _moveBToA() async {
    //添加平移
    _moveMarker = await _controller?.addSmoothMoveMarker(
      SmoothMoveMarkerOption(
        path: [lat1, lat],
        iconProvider: AssetImage("images/me.png"),
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
        iconProvider: AssetImage("images/me.png"),
        duration: Duration(seconds: 10),
      ),
    );
    Future.delayed(Duration(seconds: 10), () {
      _controller.clear();
      _controller.addMarker(_mark_option1);
      _moveBToA();
    });
  }

  _mapCallBack() async {
    //获取定位权限
    await Permission.locationWhenInUse.request();
    //展示我的位置
    _controller.showMyLocation(MyLocationOption(show: true));
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
              Image.asset('images/me.png'),
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
              zoomLevel: 19,
              onMarkerClicked: (Marker marker) {
                print(marker.iosModel.get_title());
              },
              onMapClicked: (LatLng coord) {
                print(coord);
              },
              markers: [
                // _mark_option1,
                // _mark_option2,
              ],
              onMapCreated: (controller) async {
                _controller = controller;
                _mapCallBack();
              },
              autoRelease: true,
            ),
          )),
        ],
      )
    ]);
  }
}
