import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uu_project/theme/button_widget.dart';
import 'package:uu_project/theme/colors.dart';
import 'package:uu_project/theme/drawer_tile_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  final bool paymentMethod = true; //TODO: 백엔드 연결하기 전 테스트용이므로 나중에 지우기
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Container()),
                      const Text(
                        'NAME', //TODO:여기에 사용자 이름 받아서 넣기
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Main'),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "EMAIL",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Main'),
                      ), //TODO:여기에 사용자 이메일 받아서 넣기
                    ]),
              ),
              decoration: BoxDecoration(
                color: primary,
              ),
            ),
            drawerTile(
                name: "결제수단 등록",
                onPressed: () {
                  Get.back();
                  Get.toNamed('/paymentMethod');
                }),
            const Divider(),
            drawerTile(
                name: "로그아웃",
                onPressed: () {
                  Get.back();
                  Get.toNamed('/paymentMethod'); //TODO: 로그아웃
                })
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "우산 보관함 현황",
          style: TextStyle(
            fontFamily: 'Main',
            fontSize: 22,
          ),
        ),
        backgroundColor: primary,
      ),
      body: Map(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: mainButton(
          buttonText: "대여하기",
          onPressed: () {
            paymentMethod
                ? Get.toNamed('/payment')
                : Get.toNamed('/paymentMethod');
          }),
    );
  }
}

class Map extends StatelessWidget {
  const Map({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: ShowMap(),
    );
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class ShowMap extends StatefulWidget {
  const ShowMap({Key? key}) : super(key: key);

  @override 
  _ShowMapState createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {
  final Completer<GoogleMapController> _controller = Completer();
  
  static const handong = CameraPosition(
    target: LatLng(36.10308582709887, 129.38844269323445),
    zoom: 17.5,
  );
  
  final Set<Marker> markers = new Set();
    
  static const LatLng showLocation = LatLng(36.10308582709887, 129.38844269323445);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: GoogleMap(
          markers: getmarkers(),
          mapType: MapType.normal,
          initialCameraPosition: handong,
          onMapCreated: (GoogleMapController controller) {
            setState((){
              _controller.complete(controller);
            });
          },
          
          compassEnabled:true,
          zoomGesturesEnabled: true,
          rotateGesturesEnabled: true,
          tiltGesturesEnabled: true,
          myLocationButtonEnabled: false,
          cameraTargetBounds: CameraTargetBounds(LatLngBounds(northeast: const LatLng(36.105136, 129.392519), southwest: const LatLng(36.101216, 129.385075))),
        ),
      ),
    );
  }
  Set<Marker> getmarkers() {
    setState((){
      markers.add(Marker(
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(36.103698, 129.387437),
        infoWindow: const InfoWindow(
          title: '느헤미야 NMH',
          snippet: '우산갯수 : 4개',
        ),
        icon: BitmapDescriptor.defaultMarker
      ));
      markers.add(Marker(
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(36.103328, 129.386886),
        infoWindow: const InfoWindow(
          title: '뉴턴 NTH',
          snippet: '우산갯수 : 4개',
        ),
        icon: BitmapDescriptor.defaultMarker
      ));
      markers.add(Marker(
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(36.102789, 129.387098),
        infoWindow: const InfoWindow(
          title: '오석 OH',
          snippet: '우산갯수 : 4개',
        ),
        icon: BitmapDescriptor.defaultMarker
      ));
    });
    return markers;
  }
}
