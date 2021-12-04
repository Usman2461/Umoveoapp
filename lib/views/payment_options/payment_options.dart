import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:umoveo/constants/colors.dart';
import 'package:umoveo/models/directions_model.dart';
import 'package:umoveo/services/directions_repository.dart';
import 'package:umoveo/widgets/custom_app_bar.dart';
import 'package:umoveo/widgets/custom_buttom.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({Key? key}) : super(key: key);

  @override
  _PaymentOptionsState createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {

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
        text: "Payment Options",
        onTap: () { Navigator.pop(context);},
        showLeading: true,
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
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
      bottomSheet: Card(
        elevation: 10.0,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
        child: Container(
          height: 350.0,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select Payment", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    child: ListTile(
                      leading: Image(
                        width: 20,
                        height: 20,
                        image: AssetImage("assets/images/mastercard.png"),
                      ),
                      title: Text("**** 8295"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    child: ListTile(
                      leading: Image(
                        width: 20,
                        height: 20,
                        image: AssetImage("assets/images/visacard.png"),
                      ),
                      title: Text("**** 3704"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    child: ListTile(
                      leading: Image(
                        width: 20,
                        height: 20,
                        image: AssetImage("assets/images/cashpay.png"),
                      ),
                      title: Text("Cash"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Center(
                    child: CustomButtom(
                      leadingIcon: Icons.add,
                        negativeWidth: 20,
                        text: "Add Credit/Debit Card",
                        onTap: () {
                          Navigator.pushNamed(context, "/addCard");
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
    mapMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(40,40)), "assets/images/startpoint.png");
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