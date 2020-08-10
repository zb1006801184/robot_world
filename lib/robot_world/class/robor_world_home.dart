import 'package:robot_world/page_index.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:amap_location_fluttify/amap_location_fluttify.dart';

class RobotWorldHome extends StatefulWidget {
  @override
  _RobotWorldHomeState createState() => _RobotWorldHomeState();
}

class _RobotWorldHomeState extends State<RobotWorldHome> {
  @override
  AmapController _controller;
  LatLng lat = LatLng(39.89, 116.32);
  _clickInfo(Marker marker) {
    print(marker.iosModel.get_title());
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
    widget: Container(
      width: 20,
      height: 20,
      color: Colors.red,
    ),
  );

  _mapCallBack() async {
    await Permission.locationWhenInUse.request();

    _controller.showMyLocation(MyLocationOption(show: true));
    _controller.addMarker(_mark_option1);
    _controller.showZoomControl(true);
    //点击弹窗
    _controller.setInfoWindowClickListener(
      (marker) => _clickInfo(marker),
    );
    _controller.setMarkerClickedListener((marker) => _clickInfo(marker));
  
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
              zoomLevel: 15,
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
