import 'dart:async';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rapido/provider/pickupLocation.dart';

class RideConfirm extends StatefulWidget {
  const RideConfirm({super.key});

  @override
  State<RideConfirm> createState() => _RideConfirmState();
}

class _RideConfirmState extends State<RideConfirm> {
  final Completer<GoogleMapController> _controllerGoogleMap2 = Completer();
  List<LatLng> polylineCoordinates = [];
 
  // showDailogBox(context) {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return Center(
  //             child: Container());
  //       });
  // }


 

  dynamic createPolyLine() {
      void getPolyPoints() async {
        PolylinePoints polylinePoints = PolylinePoints();
        PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          'AIzaSyAbN1uulBVvR6GkHkJUniPC9nkQ7yYcXAo', // Your Google Map Key
          PointLatLng(
            pickupPoint.location1.last.latitude,
            pickupPoint.location1.last.longitude,
          ),
          PointLatLng(
            pickupPoint.location2.last.latitude,
            pickupPoint.location2.last.longitude,
          ),
        );
        if (result.points.isNotEmpty) {
          result.points.forEach(
            (PointLatLng point) => polylineCoordinates.add(
              LatLng(point.latitude, point.longitude),
            ),
          );
          setState(() {});
        }
      }

      return getPolyPoints();
    
  }

  @override
  void initState() {
    
    createPolyLine();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          // leading: IconButton(onPressed: (){
          //   Navigator.pop(context);
          // }, icon: Icon(Icons.arrow_back_outlined)),
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(alignment: AlignmentDirectional.topCenter, children: [
            Positioned(
              child: SizedBox(
                width: screenWidth,
                height: screenHeight * .75,
                child: GoogleMap(
                  zoomControlsEnabled: false,
                  markers: {



                    
                    Marker(
                        // icon: BitmapDescriptor.defaultMarkerWithHue(3),
                        // infoWindow:InfoWindow(title: 'Pickup Point'),
                        markerId: const MarkerId('PickupLocation'),
                        position: LatLng(
                          pickupPoint.location1.last.latitude,
                          pickupPoint.location1.last.longitude,
                        ),
                        infoWindow: const InfoWindow(title: 'Pickup Point')),
                    Marker(
                        markerId: const MarkerId('DropLocation'),
                        position: LatLng(
                          pickupPoint.location2.last.latitude,
                          pickupPoint.location2.last.longitude,
                        ),
                        infoWindow: const InfoWindow(title: 'Drop Point'))
                  },
                  polylines: {
                    Polyline(
                      polylineId: const PolylineId("route"),
                      points: polylineCoordinates,
                      color: const Color(0xFF7B61FF),
                      width: 4,
                    ),
                  },
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(
                        pickupPoint.location1.last.latitude,
                        pickupPoint.location1.last.longitude,
                      ),
                      zoom: 14),
                  onMapCreated: (GoogleMapController controller) {
                    _controllerGoogleMap2.complete(controller);
                    // _newGoogleMapController = controller;
                  },
                ),
              ),
            ),
            Positioned(
                width: screenWidth,
                top:  screenHeight * .71,
                child: Container(
                        height: screenHeight * .28,
                        padding:
                            const EdgeInsets.only(left: 23, right: 23, top: 20),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20))),
                        child: Column(
                          children: [
                            Text('Captain arrived soon ...')
                          ],
                          
                        )))
          ]),
        ),
      ),
    );
  }
}
