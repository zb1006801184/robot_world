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

class _RobotWorldHomeState extends State<RobotWorldHome> {
  @override
  AmapController _controller;
  LatLng lat = LatLng(39.89, 116.32);
  SmoothMoveMarker _moveMarker;

  List<Marker> markers = [];

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

  MarkerOption _mark_option1 = MarkerOption(
      latLng: LatLng(39.89, 116.32),
      title: "你好啊！我是机器人！",
      snippet: "小谛",
      infoWindowEnabled: true,
      iconProvider: AssetImage("images/me.png"));

  _mapCallBack() async {
    //获取定位权限
    await Permission.locationWhenInUse.request();
    //展示我的位置
    _controller.showMyLocation(MyLocationOption(show: true));
    //添加mark
    _controller.addMarker(_mark_option1);
    //点击弹窗
    _controller.setInfoWindowClickListener(
      (marker) => _clickInfo(marker),
    );
    //点击mark
    _controller.setMarkerClickedListener((marker) async {
      
      _controller.clearMarkers([marker]);
      // await _controller.showCustomInfoWindow(
      //   marker,
      //   Container(
      //     width: 128,
      //     height: 60,
      //     decoration: BoxDecoration(
      //       color: Colors.yellow,
      //       borderRadius: BorderRadius.circular(16),
      //     ),
      //     child: Text(await marker.title),
      //   ),
      // );
    });
    //添加平移
    _moveMarker = await _controller?.addSmoothMoveMarker(
      SmoothMoveMarkerOption(
        path: [getNextLatLng(), lat, getNextLatLng()],
        iconProvider: AssetImage("images/me.png"),
        duration: Duration(seconds: 10),
      ),
    );
    //暂停
    Future.delayed(
      Duration(seconds: 3),
      () {
        _moveMarker.stop();
        // SmoothMoveMarker.android(mar)
        // _controller.clearMarkers([_moveMarker]);
      },
    );
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
    //五秒后显示自定义
  }

  _showBox(Marker _marker) {
    _marker.showInfoWindow();
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
              showScaleControl: true,
              zoomLevel: 6,
              onMarkerClicked: (Marker marker) {
                print(marker.iosModel.get_title());
              },
              onMapClicked: (LatLng coord) {
                print(coord);
              },
              markers: [
                // _mark_option,
                // _mark_option1,
              ],
              onMapCreated: (controller) async {
                _controller = controller;

                _mapCallBack();
              },
            ),
          )),
        ],
      )
    ]);
  }
}
