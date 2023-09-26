import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:math';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// final pickupLocation = ChangeNotifierProvider<pickupPoint>((ref) => pickupPoint());

class pickupPoint {
  static Position? userCurrentPosition;
  static LatLng? markerPosition;
  static Set<Marker> markers = {};
  static CameraPosition? cameraPosition;
  static List<Placemark> placemarks = [];
  static String? address;
  static List<Location> location1 = [];
  static List<Location> location2 = [];

  static setmarkerPosition(LatLng? position) {
    markers.clear();
    markers.add(
      Marker(
          markerId: const MarkerId("currentLocation"),
          position: LatLng(
              position?.latitude as double, position?.longitude as double)),
    );
  }

  // static pickupAddress(){
  //      placemarks.add([
  //     ...await placemarkFromCoordinates(userCurrentPosition?.latitude as double,
  //         userCurrentPosition?.longitude as double)
  //   ].last);
  // }
  static num getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2) {
    var R = 6371; // Radius of the earth in km
    deg2rad(deg) {
      return deg * (pi / 180);
    }

    var dLat = deg2rad(lat2 - lat1); // deg2rad below
    var dLon = deg2rad(lon2 - lon1);
    var a = sin(dLat / 2) * sin(dLat / 2) +
        cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * sin(dLon / 2) * sin(dLon / 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    var d = R * c; // Distance in km
    return d;
  }
}
