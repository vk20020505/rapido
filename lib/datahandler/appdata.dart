import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';
import '../models/address.dart';

// class AppData extends ChangeNotifier {
//   Address? pinnedLocationOnMap;

//   void updatePickupLocationAddress(Address pickUpAddress) {
//     pinnedLocationOnMap = pickUpAddress;
//     notifyListeners();
//   }
// }

class AppData {
  Address? pinnedLocationOnMap;

  void updatePickupLocationAddress(Address pickUpAddress) {
    pinnedLocationOnMap = pickUpAddress;
    
  }
}

class AssistantMethods {
  static Future<String> pickOriginPositionOnMap(
    LatLng position, context) async {
    String placeAddress = '';
    String province = '';
    String locality = '';
    String name = '';
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

        if(placemarks.isNotEmpty){
          province = placemarks[0].country == null? '': placemarks[0].administrativeArea!;
          locality = placemarks[0].locality == null? '': placemarks[0].locality!;
          name = placemarks[0].name == null? '': placemarks[0].name!;

          placeAddress = '$name, $locality, $province';
        }
        Address userPickUpAddress = Address();
        userPickUpAddress.latitude = position.latitude;
        userPickUpAddress.longitude = position.longitude;
        userPickUpAddress.placeName = placeAddress;

        // Provider.of<AppData>(context, listen:false).updatePickupLocationAddress(userPickUpAddress);
        
        return placeAddress;
  }
}