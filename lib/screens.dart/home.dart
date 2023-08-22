import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rapido/screens.dart/bottomsheet.dart';
import 'package:rapido/screens.dart/drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Set<Marker> markers = {};

  Future<Position> getUserCurrentLocation() async {
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
    
    return await Geolocator.getCurrentPosition();
    // await Geolocator
    //           .requestPermission()
    //                               .then((value){
    //                           })
    //                           .onError((error, stackTrace){
    //                             print("Error:${error.toString()}");
    //                           });

    //                           return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: ElevatedButton(
          child: const Text("location"),
          onPressed: () async {
            // print('${Position.latitude.toString()}');
            Position position = await getUserCurrentLocation();

            GoogleMapController controller = await _controller.future;

            controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: 14)));

            // googleMapController.animateCamera(CameraUpdate.newCameraPosition(
            //       CameraPosition(
            //           target: LatLng(position.latitude, position.longitude),
            //           zoom: 14)));

            markers.clear();
            markers.add(
              Marker(
                  markerId: const MarkerId("currentLocation"),
                  position: LatLng(position.latitude, position.longitude)),
            );
            setState(() {});
            // getUserCurrentLocation().then((value) async{
            //   print("My current location");
            //   print('${value.latitude.toString()} ,${value.longitude.toString()}');

            // });
          },
        ),
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
                  Card(
                      // semanticContainer: false,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      elevation: 3,
                      child: Container(
                        // width: 305,
                        padding: const EdgeInsets.only(left: 20, right: 8),
                        height: 50,
                        width: MediaQuery.sizeOf(context).width - 90,
                        // decoration: BoxDecoration(
                        //     // color: Colors.red,
                        //     borderRadius: BorderRadius.circular(40)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 6,
                                  ),
                                ),
                                Text(
                                  "Your Current Location",
                                  style: TextStyle(fontSize: 15),
                                  // style: Theme.of(context).textTheme.titleSmall,
                                )
                              ],
                            ),
                            // Icon(Icons.favorite_outline_outlined,size: 28,),
                            IconButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {
                                  favoriteLocation(context);
                                },
                                // favoriteLocation(context),
                                icon: const Icon(
                                  Icons.favorite_outline_outlined,
                                  size: 25,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                      )),
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
                // top: ,
                // bottom: 10,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * .6,
                  // color: Colors.amber,
                  child: GoogleMap(
                    zoomControlsEnabled: false,
                    // compassEnabled: false,
                    markers: markers,
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
              ),
              Positioned(
                width: MediaQuery.sizeOf(context).width,
                top: MediaQuery.sizeOf(context).height * .57,
                child: Container(
                  // padding:EdgeInsets.all(30),
                  // width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * .4,
                  padding: const EdgeInsets.only(left: 23, right: 23, top: 20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(width: 2),
                      // borderRadius: BorderRadius.circular(20)
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        color: Colors.grey.shade200,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        elevation: 5,
                        child: Container(
                          height: 55,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 6,
                                ),
                              ),
                              Text(
                                "Enter Drop Location",
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                        ),
                      ),

                      Image(
                          height: MediaQuery.sizeOf(context).height * .2,
                          fit: BoxFit.cover,
                          width: 210,
                          image: AssetImage('assets/images/rapido1.jpg')),
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
        // bottomSheet: Container(
        //   height: MediaQuery.sizeOf(context).height * .4,
        //   padding: const EdgeInsets.only(left: 23,right:23, top: 20),
        //   decoration: BoxDecoration(
        //     color: Colors.blue.shade100,
        //     // border: Border.all(width: 2),
        //     // borderRadius: BorderRadius.circular(20)
        //       borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25))
        //       ),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Card(
        //         color: Colors.grey.shade200,
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(40)),
        //         elevation: 5,
        //         child: Container(
        //           height: 55,
        //           width: double.infinity,
        //           padding: const EdgeInsets.symmetric(horizontal: 20),
        //           child:  Row(
        //             children: [
        //               const Padding(
        //                 padding: EdgeInsets.only(right: 10),
        //                 child: CircleAvatar(
        //                   backgroundColor: Colors.red,
        //                   radius: 6,
        //                 ),
        //               ),
        //               Text(
        //                 "Enter Drop Location",
        //                 style: Theme.of(context).textTheme.titleMedium,
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //       // Container(
        //       //   width: 210,
        //       //   height: 167,
        //       //  decoration: BoxDecoration(image: DecorationImage(
        //       //   fit: BoxFit.cover,
        //       //   image: AssetImage('assets/images/rapido1.jpg')),
        //       //   color: Colors.red),

        //       // ),

        //     const Image(
        //       height: 167,
        //       fit: BoxFit.cover,
        //       width: 210,
        //       image: AssetImage('assets/images/rapido1.jpg')),
        //        Text(
        //         "Book ride now by searching for your drop location",
        //         textAlign: TextAlign.center,
        //         style: Theme.of(context).textTheme.bodyMedium,
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
