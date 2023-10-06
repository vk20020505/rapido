import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LiveLocation extends StatefulWidget {
  const LiveLocation({super.key, required this.user_id});
  final String user_id;

  @override
  State<LiveLocation> createState() => _LiveLocationState();
}

class _LiveLocationState extends State<LiveLocation> {
  bool added = false;
  final Completer<GoogleMapController> _controllerGoogleMap3 = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('location').snapshots(),
        // initialData: initialData,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (added) {
            myMap(snapshot);
          }
          if(!snapshot.hasData) {
 return Center(child: CircularProgressIndicator());
          }
          return Container(
            height: MediaQuery.sizeOf(context).height * .7,
            child: GoogleMap(
              mapType: MapType.normal,
              markers: {
                Marker(
                    markerId: MarkerId('id'),
                    position: LatLng(
                      snapshot.data!.docs.singleWhere((element) =>
                          element.id == widget.user_id)['latitude'],
                      snapshot.data!.docs.singleWhere((element) =>
                          element.id == widget.user_id)['longitude'],
                    ))
              },
              initialCameraPosition: CameraPosition(
                  zoom: 14,
                  target: LatLng(
                    snapshot.data!.docs.singleWhere(
                        (element) => element.id == widget.user_id)['latitude'],
                    snapshot.data!.docs.singleWhere(
                        (element) => element.id == widget.user_id)['longitude'],
                  )),
              onMapCreated: (GoogleMapController controller) async {
                _controllerGoogleMap3.complete(controller);
                setState(() {
                  added = true;
                });
                // _newGoogleMapController = controller;
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> myMap(AsyncSnapshot<QuerySnapshot> snapshot) async {
    GoogleMapController controller = await _controllerGoogleMap3.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(
          snapshot.data!.docs.singleWhere(
              (element) => element.id == widget.user_id)['latitude'],
          snapshot.data!.docs.singleWhere(
              (element) => element.id == widget.user_id)['longitude'],
        ),
        zoom: 14)));
  }
}
