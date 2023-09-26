import 'dart:async';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rapido/provider/pickupLocation.dart';

class BookRide extends StatefulWidget {
  const BookRide({super.key});

  @override
  State<BookRide> createState() => _BookRideState();
}

class _BookRideState extends State<BookRide> {
  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  List<LatLng> polylineCoordinates = [];

  bool checkDistance() {
    num distance = pickupPoint.getDistanceFromLatLonInKm(
      pickupPoint.location1.last.latitude,
      pickupPoint.location1.last.longitude,
      pickupPoint.location2.last.latitude,
      pickupPoint.location2.last.longitude,
    );
    if (distance * 1000 > 10000) {
      return true;
    } else {
      return false;
    }
  }

 dynamic createPolyLine() {
    if (checkDistance()) {
      return null;
    } else {
      
        void getPolyPoints() async {
          PolylinePoints polylinePoints = PolylinePoints();
          PolylineResult result =
              await polylinePoints.getRouteBetweenCoordinates(
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
  }

  @override
  void initState() {
    checkDistance();
    createPolyLine();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
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
              height: checkDistance() ? screenHeight * .75 : screenHeight * .6,
              child: GoogleMap(
                zoomControlsEnabled: false,
                markers: {
                  Marker(
                      markerId: MarkerId('PickupLocation'),
                      position: LatLng(
                        pickupPoint.location1.last.latitude,
                        pickupPoint.location1.last.longitude,
                      ),
                      infoWindow: const InfoWindow(title: 'Pickup Point')),
                  Marker(
                      markerId: MarkerId('DropLocation'),
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
                initialCameraPosition:
                     CameraPosition(target: LatLng(pickupPoint.location1.last.latitude,
                        pickupPoint.location1.last.longitude,), zoom: 14),
                onMapCreated: (GoogleMapController controller) {
                  _controllerGoogleMap.complete(controller);
                  // _newGoogleMapController = controller;
                },
              ),
            ),
          ),
          Positioned(
              width: screenWidth,
              top: checkDistance() ? screenHeight * .7 : screenHeight * .57,
              child: checkDistance()
                  ? Container(
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
                          FaIcon(
                            Icons.taxi_alert,
                            size: 60,
                            color: Colors.red,
                          ),
                          // Icon(Icons.close, color: Colors.red,),
                          Text(
                            'Sorry, we cannot calculate the ride fare!!',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ))
                  : Container(
                      height: screenHeight * .35,
                      padding:
                          const EdgeInsets.only(left: 23, right: 23, top: 20),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ListView.builder(
                            padding: const EdgeInsets.all(0),
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                selectedTileColor: Colors.amber,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                leading: const CircleAvatar(
                                  backgroundColor: Colors.amber,
                                ),
                                title: const Row(
                                  children: [
                                    Text('Bike'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '2 min',
                                      style: TextStyle(color: Colors.black26),
                                    )
                                  ],
                                ),
                                trailing: SizedBox(
                                  // color: Colors.amber,
                                  width: 95,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '₹ 144',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      // const SizedBox(width: 10,),
                                      IconButton(
                                          padding: const EdgeInsets.all(0),
                                          onPressed: () {},
                                          icon: const Icon(
                                              Icons.info_outline_rounded))
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  // textStyle: TextStyle(fontSize: 15),
                                  backgroundColor: Colors.amber.shade400,
                                  fixedSize: const Size(double.maxFinite, 55)),
                              onPressed: () {},
                              child: const Text(
                                'Book bike',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ))
                        ],
                      )))
        ]),
      ),
    );
  }
}
