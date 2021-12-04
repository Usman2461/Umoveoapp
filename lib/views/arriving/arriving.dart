import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:umoveo/constants/colors.dart';
import 'package:umoveo/models/directions_model.dart';
import 'package:umoveo/services/directions_repository.dart';
import 'package:umoveo/views/main_menu/menu_drawer.dart';
import 'package:umoveo/widgets/custom_app_bar.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:umoveo/widgets/custom_buttom.dart';

class Arriving extends StatefulWidget {
  const Arriving({Key? key}) : super(key: key);

  @override
  _ArrivingState createState() => _ArrivingState();
}

class _ArrivingState extends State<Arriving> {
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  late Placemark setPlace;
  Marker? _origin;
  Marker? _destination;
  Directions? _info;
  late BitmapDescriptor mapMarker;
  late BitmapDescriptor mapMarker2;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );


  void initState() {
    // TODO: implement initState
    setCustomMarker();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Arriving',
        showLeading: true,
        icon: Image(
          width: 5,
          height: 5,
          image: AssetImage("assets/images/menuicon.png"),
        ),
        onTap: () {},
        enableDrawer: true,
      ),
      drawer: CustomDrawer(),
      body: Stack(children: [
        GoogleMap(
          markers: {
            if(_origin !=null) _origin!,
            if(_destination !=null) _destination!,
          },
          polylines: {
            if (_info != null)
              Polyline(
                polylineId: const PolylineId('overview_polyline'),
                color: Color(purpleC),
                width: 5,
                points: _info!.polylinePoints!
                    .map((e) => LatLng(e.latitude, e.longitude))
                    .toList(),
              ),
          },
          onLongPress: _addMarker,
          onMapCreated: (controller) => mapController = controller,
          mapType: MapType.none,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: _kGooglePlex,
        ),
        if (_info != null)
          Positioned(
            top: 20.0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 12.0,
              ),
              decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  )
                ],
              ),
              child: Text(
                '${_info!.totalDistance}, ${_info!.totalDuration}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
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
      ],),
      bottomSheet: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0))),
            child: Container(
              height: 250.0,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              padding: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Patrick", style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),),
                        Expanded(child: SizedBox()),
                        Card(color: Color(lightGreyC),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("300KG", style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.bold),),
                          ),)
                      ],
                    ),
                    Row(
                      children: [
                        RatingStars(valueLabelVisibility: false, value: 4,),
                        Expanded(child: SizedBox()),
                        Text("Small Truck"),
                      ],
                    ),
                    SizedBox(height: 8.0,),
                    Text("Pick Up Time: 8:00 PM", style: TextStyle(fontSize: 16.0),),
                    SizedBox(height: 8.0,),
                    Text("Drop Time: 10:00 AM", style: TextStyle(fontSize: 16.0),),
                    SizedBox(height: 8.0,),
                    Row(children: [
                      CustomButtom(onTap: (){
                        Navigator.pushNamed(context, "/chat");
                      }, text: 'Contact Driver', negativeWidth: 130,),
                      Expanded(child: SizedBox()),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, "/trackVehicle");
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          elevation: 5.0,
                          child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(Icons.close),
                        ),),
                      ),
                    ],),
                    SizedBox(width: 5.0,),

                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -60,
            left: -10,
            child: Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide.none),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100.0),
                    boxShadow: [BoxShadow(offset: Offset.fromDirection(11))]),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/dpprofile.png"),
                    radius: 45,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  void setCustomMarker() async{
    mapMarker2 = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(40,40)), "assets/images/originloc.png");
    mapMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(40,40)), "assets/images/searchvan.png");
  }
  void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {
      // Origin is not set OR Origin/Destination are both set
      // Set origin
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon: mapMarker,
          position: pos,
        );
        // Reset destination
        _destination = null;

        // Reset info
        _info = null;
      });
    } else {
      // Origin is already set
      // Set destination
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: mapMarker2,
          position: pos,
        );
      });

      // Get directions
      final directions = await DirectionsRepository(dio: null)
          .getDirections(origin: _origin!.position, destination: pos);
      setState(() => _info = directions!);
    }
  }
}
