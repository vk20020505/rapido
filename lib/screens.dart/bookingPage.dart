import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BookRide extends StatefulWidget {
  const BookRide({super.key});

  @override
  State<BookRide> createState() => _BookRideState();
}

class _BookRideState extends State<BookRide> {

    final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  @override
  Widget build(BuildContext context) {
      double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    
    return Scaffold(
      body:  SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
                  alignment: AlignmentDirectional.topCenter,
            children: [
              Positioned(
                child: SizedBox(
                  width: screenWidth,
                  height: screenHeight * .6,
                  child:  GoogleMap(
                       
                        
                          zoomControlsEnabled: false,
                       
                          markers: {
                            const Marker(markerId: 
                            MarkerId('PickupLocation'),
                            ),
                            const Marker(markerId: 
                            MarkerId('DropLocation'),
                            )
                          },
                          mapType: MapType.normal,
                          initialCameraPosition:
                               const CameraPosition(target: LatLng(28, 77), zoom: 14),
                          onMapCreated: (GoogleMapController controller) {
                            _controllerGoogleMap.complete(controller);
                            // _newGoogleMapController = controller;
                          },
                        ),
                ),
              ),
               Positioned(
                width: screenWidth,
                top: screenHeight * .57,
                child: Container(
                  height: screenHeight * .4,
                  padding: const EdgeInsets.only(left: 23, right: 23, top: 20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: const Column(
                    children: [],
                  )))
              ]
          ),),
    );
  }
}