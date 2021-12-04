import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:umoveo/constants/colors.dart';
import 'package:umoveo/models/directions_model.dart';
import 'package:umoveo/services/directions_repository.dart';
import 'package:umoveo/widgets/custom_app_bar.dart';
import 'package:umoveo/widgets/custom_buttom.dart';

class LocationViaMap extends StatefulWidget {
  const LocationViaMap({Key? key}) : super(key: key);

  @override
  _LocationViaMapState createState() => _LocationViaMapState();
}

class _LocationViaMapState extends State<LocationViaMap> {
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCustomMarker();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: "",
        showLeading: true,
        onTap: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            GoogleMap(
              markers: {
                if(_origin !=null) _origin!,
                if(_destination !=null) _destination!,
                ...markers

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
              onMapCreated: onMapCreated,
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
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(backgroundColor: Colors.white,
        onPressed: () {
          _info != null
              ? CameraUpdate.newLatLngBounds(_info!.bounds!, 100.0)
              : CameraUpdate.newCameraPosition(_kGooglePlex);
        },
        child: Icon(
          Icons.location_searching_outlined, color: Colors.black, size: 30.0,),),
      bottomSheet: Container(
        height: 250.0,
        color: Colors.transparent,
        padding: EdgeInsets.only(top: 30.0),
        child: Card(
          elevation: 10.0,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0),)),
          child: Container(
            height: 230.0,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Destination Location",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(purpleC),
                      child: Icon(Icons.location_on_rounded, color: Colors.white),
                    ),
                    title: Text("No 64, Kings Cross Underground Station, KZF67T"),
                    subtitle: Text("New York"),
                  ),
                  SizedBox(height: 20.0,),
                  Center(
                    child: CustomButtom(
                        negativeWidth: 20,
                        text: "Set Destination Location", onTap: () {
                      Navigator.pushNamed(context, "/bookingDetails");
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setCustomMarker() async{
    mapMarker2 = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(40,40)), "assets/images/originloc.png");
    mapMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(40,40)), "assets/images/originpoint.png");
  }
  void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {
      // Origin is not set OR Origin/Destination are both set
      // Set origin
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon:mapMarker2,
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
          icon: mapMarker,
          position: pos,
        );
      });

      // Get directions
      final directions = await DirectionsRepository(dio: null)
          .getDirections(origin: _origin!.position, destination: pos);
      setState(() => _info = directions!);
    }
  }

  onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      markers.add(
          Marker(markerId: MarkerId("id-1"), position: LatLng(37.42796133580664, -122.085749655962), infoWindow: InfoWindow(
        title: "Small Truck",
        snippet: 'A Historical Place'
      ),  icon: mapMarker,));
    });
  }
}
