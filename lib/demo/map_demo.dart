import 'package:robot_world/page_index.dart';
// import 'dart:math';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:city_pickers/city_pickers.dart';

class MapDemo extends StatelessWidget {
  AmapController _controller;
  _clickInfo(marker) {
    print(marker);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBarBase().configAppBar("地图"),
        body: Column(
          children: [
            InkWell(
              child: Container(
                height: 40,
                width: Global.ksWidth,
                child: Center(
                  child: Text("点击点击"),
                ),
              ),
              onTap: () async {
                // _controller.clear();
                // LatLng t =  await _controller.fromScreenLocation(Point(100, 100));
                var t =
                    await _controller.toScreenLocation(LatLng(39.09, 116.32));
                
                //     print("坐标x:${t.y},y:${t.x}");
              },
            ),
            Expanded(
                child: Container(
              child: AmapView(
                mapType: MapType.Standard,
                centerCoordinate: LatLng(39.89, 116.32),
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
                  MarkerOption(
                    latLng: LatLng(39.89, 116.32),
                    title: "你好啊！我是机器人！",
                    snippet: "小谛",
                    widget: Container(
                      width: 20,
                      height: 20,
                      color: Colors.red,
                    ),
                  ),
                ],
                onMapCreated: (controller) async {
                  _controller = controller;
                  _controller.setInfoWindowClickListener(
                  (marker) => _clickInfo(marker),
                );
                },
              ),
            )),
          ],
        ));
  }
}

// final _assetsIcon = Uri.parse('assets/images/test_icon.png');

// class MapDemo extends StatefulWidget {
//   @override
//   _MapDemoState createState() => _MapDemoState();
// }

// class _MapDemoState extends State<MapDemo> {
//   AmapController _controller;
//   List<Marker> _markers = [];
//   List<LatLng> _latLngList = [];
//   int city = 0;

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(title: const Text('绘制点标记')),
//       body: Column(
//         children: <Widget>[
//           Flexible(
//             flex: 1,
//             child: AmapView(
//               onMapCreated: (controller) async {
//                     // var status = await Permission.location.status;
//                 _controller = controller;
//                 if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
//                   ///true定位，false默认北京
//                   await controller.showMyLocation(MyLocationOption());

//                   ///设置地图缩放大学
//                   await controller.setZoomLevel(6);
//                 }
//               },
//             ),
//           ),

//           ///获取当前经纬度
//           ListTile(
//             title: Center(child: Text('获取当前位置经纬度')),
//             onTap: () async {
//               final latLng = await _controller?.getLocation();
//               toast('当前经纬度: ${latLng.toString()}');
//             },
//           ),

//           ///定位显示图标
//           ListTile(
//             title: Center(child: Text('添加Marker')),
//             onTap: _showLatLng,
//           ),

//           ///连线
//           ListTile(
//             title: Center(child: Text('添加线')),
//             onTap: () async {
//               // await _controller?.addPolyline(
//               //   _latLngList,
//               //   width: 10,
//               //   strokeColor: Colors.green,
//               // );
//             },
//           ),
//           ListTile(
//             title: Center(child: Text('删除Marker')),
//             onTap: () async {
//               if (_markers.isNotEmpty) {
//                 await _markers[0].remove();
//                 _markers.removeAt(0);
//               }
//             },
//           ),
//           ListTile(
//             title: Center(child: Text('清除所有Marker')),
//             onTap: () async {
//               await _controller.clearMarkers([]);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   ///展示定位点
//   _showLatLng() async {
//     final random = Random();
//     _controller.getLocation().then((_) {
//       //获取随机定位点
//       LatLng latLng = LatLng(
//         _.latitude + random.nextDouble(),
//         _.longitude + random.nextDouble(),
//       );

//       ///TODO 获取自动定位点
// //      LatLng latLng = _;
//       _latLngList.add(latLng);
//       print('---获取的定位点------ ${_.toString()}');
//       _getLatLng(latLng);
//     });
//   }

//   ///地图标记点
//   _getLatLng(LatLng latLng) async {
//     city = city + 1;
//     final marker = await _controller?.addMarker(
//       // context,
//       MarkerOption(
//         latLng: latLng,
//         title: '北京 $city',
//         snippet: '描述',
//         // iconUri: _assetsIcon,
//         draggable: true,
//       ),
//     );
//     _markers.add(marker);
//   }
// }
