import 'dart:async';
import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rapido/provider/pickupLocation.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rapido/screens.dart/home.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class SearchPlace extends StatefulWidget {
  const SearchPlace({super.key,});
  
//  final Completer<GoogleMapController> controller;

  @override
  State<SearchPlace> createState() => _SearchPlaceState();
}

class _SearchPlaceState extends State<SearchPlace> {
  TextEditingController controller = TextEditingController();
  String sessionToken = '122344';
  List<dynamic> placeList = [];
  // List<Location> location1 = [];
  // final Completer<GoogleMapController> _newcontrollerGoogleMap = Completer();

  var uuid = Uuid();

  @override
  void initState() {
    // TODO: implement initState

    controller.addListener(() {
      onChange();
    });
  }

  void onChange() {
    if (sessionToken == null) {
      setState(() {
        sessionToken = uuid.v4();
      });
    }
   
    getSuggestion(controller.text);
  }

  void getSuggestion(String input) async {
    String apiKey = 'AIzaSyAbN1uulBVvR6GkHkJUniPC9nkQ7yYcXAo';
    // AIzaSyApPTP2xOOFn2VsLuT5RVq-MDNnbzS_itE';
    String baseURl =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURl?input=$input&key=$apiKey&sessiontoken=$sessionToken';
    var response = await http.get(Uri.parse(request));
    print(response.body.toString());

    if (response.statusCode == 200) {
      setState(() {
        placeList = jsonDecode(response.body.toString())['predictions'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }
 
  findplace(String place) async {
    pickupPoint.location1.add([...await locationFromAddress(place)].last);
//  locations.clear();
    // print(locations);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade300,
          title: TextField(
              controller: controller,
              keyboardType: TextInputType.streetAddress,
              cursorColor: Colors.grey.shade600,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 
                       'Search pickup location',
                      
                  hintStyle: Theme.of(context).textTheme.bodySmall)),
        ),
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          child: ListView.builder(
            itemCount: placeList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(placeList[index]['description']),
                onTap: () {
                  findplace(placeList[index]['description']);
                  // print(placeList[index]);
                  //  print('this is last ${locations.last}');  
                  // HomeScreen();
          //         setState(() {
          //               pickupPoint.markerPosition = LatLng(pickupPoint.location1.last.latitude as double,
          // pickupPoint.location1.last.longitude as double);
          //         });
 
                    // print(pickupPoint.location1.last);
                    // print(pickupPoint.location1.last.latitude);
                    // print(pickupPoint.markerPosition!.latitude);
                    // Navigator.pop(context);
                    if(pickupPoint.location1.last!= null ){
                       Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                  }

                },
              );
            },
          ),
        ),
      ),
    );
  }
}
