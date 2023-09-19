import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rapido/screens.dart/bookingPage.dart';
// import 'package:provider/provider.dart';
import 'package:rapido/screens.dart/bottomsheet.dart';
import 'package:rapido/screens.dart/destinationPlace.dart';
import 'package:rapido/screens.dart/drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:rapido/screens.dart/login.dart';
import 'package:rapido/screens.dart/searchPlace.dart';
// import '../datahandler/appdata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.location});
  final Location? location;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  bool permissons = false;

  String? address;

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  final Completer<GoogleMapController> _controllerGoogleMap = Completer();

  CameraPosition? cameraPosition;

  Position? userCurrentPosition;

  LatLng? _initialPosition;

  LatLng? markerPosition;
  Set<Marker> markers = {};
  List<Placemark> placemarks = [];

  void cameraMoved() async {
    setState(() {
      markers.clear();
      markers.add(
        Marker(
            markerId: const MarkerId("currentLocation"),
            position: LatLng(markerPosition?.latitude as double,
                markerPosition?.longitude as double)),
      );

      address =
          '${placemarks.last.subLocality.toString()},${placemarks.last.locality.toString()},${placemarks.last.subAdministrativeArea.toString()},${placemarks.last.administrativeArea.toString()},';

      // '${placemarks.last.subLocality.toString()}';
    });
    placemarks.clear();
    placemarks.add([
      ...await placemarkFromCoordinates(markerPosition?.latitude as double,
          markerPosition?.longitude as double)
    ].last);
   print( '-----$placemarks-----');
   print('******$markers*******');
  }

  void getUserCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    userCurrentPosition = await Geolocator.getCurrentPosition();

   

    placemarks.add([
      ...await placemarkFromCoordinates(userCurrentPosition?.latitude as double,
          userCurrentPosition?.longitude as double)
    ].last);

  

    markers.add(
      Marker(
          markerId: const MarkerId("currentLocation"),
          position: LatLng(userCurrentPosition?.latitude as double,
              userCurrentPosition?.longitude as double)),
    );

    setState(() {
      _initialPosition = LatLng(userCurrentPosition?.latitude as double,
          userCurrentPosition?.longitude as double);
      markerPosition = _initialPosition;

      cameraPosition =
          CameraPosition(target: _initialPosition as LatLng, zoom: 14);
    

      permissons = !permissons;

    
    });
  }

  void showSearchLocation(){
    if(widget.location == null){
      return null;
    }
    else{
      void search()async{
          GoogleMapController controller = await _controllerGoogleMap.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(
                        widget.location!.latitude, widget.location!.longitude),
                    zoom: 14)));

              //  markers.clear();
              // markers.add(
              //   Marker(
              //       markerId: const MarkerId("search location"),
              //       position: LatLng(widget.location!.latitude as double,
              //            widget.location!.longitude as double)),
              // );
            setState(() {
     
              markerPosition =
                  LatLng(widget.location!.latitude, widget.location!.longitude);

              address =
                  '${placemarks.last.subLocality.toString()},${placemarks.last.locality.toString()},${placemarks.last.subAdministrativeArea.toString()},${placemarks.last.administrativeArea.toString()},';
            });

            placemarks.add([
              ...await placemarkFromCoordinates(
                widget.location!.latitude, widget.location!.longitude
                
                  )
            ].last);
            // print( '
      }
      return search();

    }
  }

  @override
  void initState() {
    getUserCurrentLocation();
    showSearchLocation();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        extendBodyBehindAppBar: true,
        floatingActionButton: FloatingActionButton(onPressed: (){
             Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookRide(
                                    
                                  )));
        }),
       
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 90),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: InkWell(
                      onTap: () {
                        _globalKey.currentState!.openDrawer();
                      },
                      child: const Card(
                        elevation: 5,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            minRadius: 20,
                            maxRadius: 24,
                            child: Icon(
                              Icons.menu,
                              color: Colors.black,
                              size: 32,
                            )),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                     
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchPlace(
                                    
                                  )));
                    },
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        elevation: 3,
                        child: Container(
                          padding: const EdgeInsets.only(left: 20, right: 8),
                          width: MediaQuery.sizeOf(context).width - 90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.green,
                                      radius: 6,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width - 190,
                                    child: StatefulBuilder(
                                      builder:
                                          (BuildContext context, setState) {
                                        return Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          address ?? 'Current location',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                              IconButton(
                                  padding: const EdgeInsets.all(0),
                                  onPressed: () {
                                    favoriteLocation(context);
                                  },
                                  icon: const Icon(
                                    Icons.favorite_outline_outlined,
                                    size: 25,
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            )),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Positioned(
                child: SizedBox(
                  width: screenWidth,
                  height: screenHeight * .6,
                  child: !permissons
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 20.0),
                                child: Text("Map loading..."),
                              ),
                              CircularProgressIndicator(
                                strokeWidth: 3,
                              )
                            ])
                      : GoogleMap(
                          onCameraMove: (position) async {
                            setState(() {
                              markerPosition = position.target;
                            });
                          },
                          onCameraMoveStarted: cameraMoved,
                          zoomControlsEnabled: false,
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                          markers: markers,
                          mapType: MapType.normal,
                          initialCameraPosition:
                              cameraPosition as CameraPosition,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DestinationPlace(
                                      
                                      )));
                        },
                        child: Card(
                          color: Colors.grey.shade100,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          elevation: 3,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 14),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 6,
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "Enter Drop Location",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Image(
                          height: screenHeight * .2,
                          fit: BoxFit.cover,
                          width: 210,
                          image: const AssetImage('assets/images/rapido1.jpg')),
                      Text(
                        "Book ride now by searching for your drop location",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelSmall,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        drawer: Drawer(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            backgroundColor: Colors.white,
            child: const drawer()),
      ),
    );
  }
}
