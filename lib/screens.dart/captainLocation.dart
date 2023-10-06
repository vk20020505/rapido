import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rapido/provider/pickupLocation.dart';
import 'package:rapido/screens.dart/liveLocation.dart';

class RideConfirm extends StatefulWidget {
  const RideConfirm({super.key});

  @override
  State<RideConfirm> createState() => _RideConfirmState();
}

class _RideConfirmState extends State<RideConfirm> {
  final Completer<GoogleMapController> _controllerGoogleMap2 = Completer();
  List<LatLng> polylineCoordinates = [];
  final Location location = Location();
  //
    bool added = false;
  final Completer<GoogleMapController> _controllerGoogleMap3 = Completer();

  StreamSubscription<LocationData>? locationSubscription;

  // showDailogBox(context) {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return Center(
  //             child: Container());
  //       });
  // }

  // dynamic createPolyLine() {
  //   void getPolyPoints() async {
  //     PolylinePoints polylinePoints = PolylinePoints();
  //     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //       'AIzaSyAbN1uulBVvR6GkHkJUniPC9nkQ7yYcXAo', // Your Google Map Key
  //       PointLatLng(
  //         pickupPoint.location1.last.latitude,
  //         pickupPoint.location1.last.longitude,
  //       ),
  //       PointLatLng(
  //         pickupPoint.location2.last.latitude,
  //         pickupPoint.location2.last.longitude,
  //       ),
  //     );
  //     if (result.points.isNotEmpty) {
  //       result.points.forEach(
  //         (PointLatLng point) => polylineCoordinates.add(
  //           LatLng(point.latitude, point.longitude),
  //         ),
  //       );
  //       setState(() {});
  //     }
  //   }

  //   return getPolyPoints();
  // }

  @override
  void initState() {
    // createPolyLine();
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
            // Positioned(
            //   child: SizedBox(
            //     width: screenWidth,
            //     height: screenHeight * .75,
            //     child: GoogleMap(
            //       zoomControlsEnabled: false,
            //       markers: {
            //         Marker(
            //             // icon: BitmapDescriptor.defaultMarkerWithHue(3),
            //             // infoWindow:InfoWindow(title: 'Pickup Point'),
            //             markerId: const MarkerId('PickupLocation'),
            //             position: LatLng(
            //               pickupPoint.location1.last.latitude,
            //               pickupPoint.location1.last.longitude,
            //             ),
            //             infoWindow:
            //                 const InfoWindow(title: 'Pickup Point')),
            //         Marker(
            //             markerId: const MarkerId('DropLocation'),
            //             position: LatLng(
            //               pickupPoint.location2.last.latitude,
            //               pickupPoint.location2.last.longitude,
            //             ),
            //             infoWindow: const InfoWindow(title: 'Drop Point'))
            //       },
            //       polylines: {
            //         Polyline(
            //           polylineId: const PolylineId("route"),
            //           points: polylineCoordinates,
            //           color: const Color(0xFF7B61FF),
            //           width: 4,
            //         ),
            //       },
            //       mapType: MapType.normal,
            //       initialCameraPosition: CameraPosition(
            //           target: LatLng(
            //             pickupPoint.location1.last.latitude,
            //             pickupPoint.location1.last.longitude,
            //           ),
            //           zoom: 14),
            //       onMapCreated: (GoogleMapController controller) {
            //         _controllerGoogleMap2.complete(controller);
            //         // _newGoogleMapController = controller;
            //       },
            //     ),
            //   ),
            // ),
            Positioned(
                width: screenWidth,
                top: screenHeight * .70,
                child: Container(
                    height: screenHeight * .3,
                    padding:
                        const EdgeInsets.only(left: 23, right: 23, top: 20),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                    child: Column(
                      children: [
                        // const Text('Captain arrived soon ...'),
                        Wrap(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  getLocation();
                                },
                                child: const Text('Add ')),
                                 ElevatedButton(
                            onPressed: () {
                              listenLocation();
                            },
                            child: const Text('Enable live')),

                        ElevatedButton(
                            onPressed: () {
                              stopListening();
                            },
                            child: const Text('Stop')),
                          ],
                        ),
                       

                        Expanded(
                            child: StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('location')
                                    .snapshots(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.all(0),
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(snapshot
                                              .data!.docs[index]['name']
                                              .toString()),
                                          subtitle: Row(
                                            children: [
                                              Text(snapshot
                                                  .data!.docs[index]['latitude']
                                                  .toString()),
                                                  SizedBox(width: 10,),
                                              Text(snapshot.data!
                                                  .docs[index]['longitude']
                                                  .toString())
                                            ],
                                          ),
                                          trailing: IconButton(
                                              onPressed: () {
                                                print(snapshot.data!
                                                          .docs[index].id);
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return LiveLocation(
                                                      user_id: snapshot.data!
                                                          .docs[index].id);
                                                }));
                                              },
                                              icon: const Icon(Icons.directions)),
                                        );
                                      });
                                }))
                      ],
                    )))
          ]),
        ),
      ),
    );
  }

  getLocation() async {
    try {
      final LocationData locationResult = await location.getLocation();
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitude': locationResult.latitude,
        'longitude': locationResult.longitude,
        'name': 'john'
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Future<void> listenLocation() async {
    locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      locationSubscription?.cancel();
      setState(() {
        locationSubscription = null;
      });
    }).listen((LocationData currentLocation) async {
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitude': currentLocation.latitude,
        'longitude': currentLocation.longitude,
        'name': 'john'
      }, SetOptions(merge: true));
    });
  }

  stopListening() {
    locationSubscription?.cancel();
    setState(() {
      locationSubscription = null;
    });
  }

  //  Future<void> myMap(AsyncSnapshot<QuerySnapshot> snapshot) async {
  //   GoogleMapController controller = await _controllerGoogleMap3.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
  //       target: LatLng(
  //         snapshot.data!.docs.singleWhere(
  //             (element) => element.id == widget.user_id)['latitude'],
  //         snapshot.data!.docs.singleWhere(
  //             (element) => element.id == widget.user_id)['longitude'],
  //       ),
  //       zoom: 14)));
  // }

}
