import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:umoveo/constants/colors.dart';
import 'package:umoveo/widgets/custom_buttom.dart';

class SelectVehicle extends StatefulWidget {
  const SelectVehicle({Key? key}) : super(key: key);

  @override
  _SelectVehicleState createState() => _SelectVehicleState();
}

class _SelectVehicleState extends State<SelectVehicle> {
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  late Placemark setPlace;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mapController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(purpleC),
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () {
             Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Card(
                elevation: 4.0,
                shape: CircleBorder(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 80.0),
          child: Container(
            padding: EdgeInsets.all(18.0),
            child: Text(
              "View Available Trucks in real-time",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            onMapCreated: (controller) => mapController = controller,
            mapType: MapType.normal,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _kGooglePlex,
          ),
          Positioned(
            bottom: 100,
            right: 20,
            child: GestureDetector(
              onTap: (){
                mapController.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
              },
              child: Card(shape:CircleBorder(),child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.location_searching),
              ),),
            ),
          ),
          Positioned(
              bottom:10,child: CustomButtom(text: "Send Pick Up Request", onTap: (){
                Navigator.pushNamed(context, "/addressSelection");
          })),
        ],
      ),

    );
  }
  Future<bool> _updateMarker(_lat, _lng) async {
    try {
      if (markers.isNotEmpty) markers.clear();
      List<Placemark> placemarks = await placemarkFromCoordinates(_lat, _lng);
      Placemark place = placemarks[0];
      String startCoordinatesString = '($_lat, $_lng)';
      Marker startMarker = Marker(
          markerId: MarkerId(startCoordinatesString),
          position: LatLng(_lat, _lng),
          infoWindow: InfoWindow(
            title: 'samp ${place.name}, ${place.locality} ',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(0),
          onTap: () async {
            mapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(_lat, _lng),
                  tilt: 50.0,
                  bearing: 45.0,
                  zoom: 20.0,
                ),
              ),
            );
          });
      mapController = await _controller.future;
      markers.add(startMarker);

      return true;
    } catch (e) {
      print('MAP Exception - locationScreen.dart - _updateMarker():' + e.toString());
    }
    return false;
  }
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
