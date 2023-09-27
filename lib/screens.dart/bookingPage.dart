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

  showDailogBox(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return  Center(
              child: SizedBox(
                width: double.maxFinite,
            height: MediaQuery.sizeOf(context).height*.68,
            child: AlertDialog( 
              titlePadding: EdgeInsets.all(0),
              contentPadding: EdgeInsets.all(0),
            
              // title: Text('Auto'),
              content: Column(
                children: [
                  Container(height: 40,color: Colors.black,),
                  SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.white,child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(child: Divider(thickness: 2,)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal:10.0),
                            child: Text('Auto'),
                          ),
                          Expanded(child: Divider(thickness: 2,)),
                        ],
                      ),
                      Text( '₹ 144 *', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Text('Total Estimated fare price including taxes.', style: TextStyle(fontSize: 13,)),
                      Divider(height: 10,thickness: 2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("Ride Fare"), 
                        Text( '₹ 64')
                      ],),
                        Divider(height: 10,thickness: 2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("Ride Fare"), 
                        Text( '₹ 54')
                      ],),
                      Divider(height: 10,thickness: 2,),
                      Padding(
                        padding: EdgeInsets.only(top:8.0, bottom: 15),
                        child: Text('* Price may vary if you change pickup or drop location, toll area', style: TextStyle(fontSize: 15,)),
                      ),
                      Text('Rs.4.2/km till 3 KMs,Rs.5.7/km till 8 KMs,Rs.6.8/km till 12 KMs,Rs.7.9/km post 12 KMs ', style: TextStyle(fontSize: 15,), overflow: TextOverflow.clip,),
                      Text('Coupon & pass benefits may be removed depending on the validity at time of ride.', style: TextStyle(fontSize: 15,)),
                      Text('Surge charges may apply due to traffic & weather', style: TextStyle(fontSize: 15,)),
                     

                    ],
                  ),),
                   Divider(thickness: 2,),
                ],
              ),
              buttonPadding: EdgeInsets.all(0),
              actionsPadding: EdgeInsets.only(bottom: 10),
              actionsAlignment: MainAxisAlignment.center,
              actions: [TextButton(onPressed: (){
                Navigator.pop(context);
              }, 
              // style: TextButton.styleFrom(backgroundColor: Colors.blue),
              child: Text('Got it'))],
            ),
            // child: DatePickerDialog(initialDate: initialDate, firstDate: firstDate, lastDate: lastDate),
          ));
        });
  }

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
                      child: const Column(
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
                            itemCount: 2,
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
                                          onPressed: () {
                                            showDailogBox(context);
                                          },
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
