import 'dart:async';
// import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:rapido/screens.dart/bottomsheet.dart';
import 'package:rapido/screens.dart/drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rapido/screens.dart/searchPlace.dart';

import '../datahandler/appdata.dart';

// import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool clicked = false;

  String? address;

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  final Completer<GoogleMapController> _controllerGoogleMap = Completer();

  GoogleMapController? _newGoogleMapController;

  static CameraPosition? _cameraPosition;
  Position? userCurrentPosition;
  static LatLng? _initialPosition;
  // Set<Marker> markers = {};

  void getUserCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      // Fluttertoast.showToast(msg: 'Location services are disabled');
      return Future.error('Location services are disabled');
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // Fluttertoast.showToast(msg: 'Location permission denied');
        return Future.error('Location permission denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Fluttertoast.showToast(msg: 'Location permissions are permanently denied');
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();
    userCurrentPosition = position;

    setState(() {
      _initialPosition =
          LatLng(userCurrentPosition!.latitude, userCurrentPosition!.longitude);
      _cameraPosition =
          CameraPosition(target: _initialPosition as LatLng, zoom: 14);
      _newGoogleMapController
          ?.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition!));
    });
    // return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    getUserCurrentLocation();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context);
    String originAddress ;
    if (appData.pinnedLocationOnMap != null) {
      originAddress = appData.pinnedLocationOnMap!.placeName.toString();
    } else {
      originAddress =  'You are here';
    }
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: ElevatedButton(
        //   child: const Text("location"),
        //   onPressed: () async {

        //     Position position = await getUserCurrentLocation();

        //     GoogleMapController controller = await _controller.future;

        //     controller.animateCamera(CameraUpdate.newCameraPosition(
        //         CameraPosition(
        //             target: LatLng(position.latitude, position.longitude),
        //             zoom: 14)));

        //     // googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        //     //       CameraPosition(
        //     //           target: LatLng(position.latitude, position.longitude),
        //     //           zoom: 14)));

        //     markers.clear();
        //     markers.add(
        //       Marker(
        //           markerId: const MarkerId("currentLocation"),
        //           position: LatLng(position.latitude, position.longitude)),
        //     );

        //     List<Placemark> placemarks = await placemarkFromCoordinates(
        //         position.latitude, position.longitude);

        //     address =
        //         '${placemarks.reversed.last.subLocality.toString()},${placemarks.reversed.last.locality.toString()},${placemarks.reversed.last.subAdministrativeArea.toString()},${placemarks.reversed.last.administrativeArea.toString()},';
        //     print(address);
        //     setState(() {});
        //   },
        // ),
        key: _globalKey,
        extendBodyBehindAppBar: true,
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
                      setState(() {
                        clicked = !clicked;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SearchPlace(click: clicked)));
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
                                    child: Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      originAddress,
                                      // 'Current location',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
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
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * .6,
                  child: GoogleMap(
                    zoomControlsEnabled: false,
                    zoomGesturesEnabled: true,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    // markers: markers,
                    mapType: MapType.normal,
                    initialCameraPosition: _cameraPosition!,
                    onMapCreated: (GoogleMapController controller) {
                      _controllerGoogleMap.complete(controller);
                      _newGoogleMapController = controller;
                    },
                  ),
                ),
              ),
              Positioned(
                width: MediaQuery.sizeOf(context).width,
                top: MediaQuery.sizeOf(context).height * .57,
                child: Container(
                  height: MediaQuery.sizeOf(context).height * .4,
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
                          setState(() {
                            clicked = !clicked;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchPlace(
                                        click: clicked,
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
                          height: MediaQuery.sizeOf(context).height * .2,
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
