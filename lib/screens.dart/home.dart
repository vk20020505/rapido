import 'package:flutter/material.dart';
import 'package:rapido/screens.dart/bottomsheet.dart';
import 'package:rapido/screens.dart/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        extendBodyBehindAppBar: true,
        // appBar:
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 90),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 20),
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
                            radius: 24,
                            child: Icon(
                              Icons.menu,
                              color: Colors.black,
                              size: 32,
                            )),
                      ),
                    ),
                  ),
                  Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      elevation: 3,
                      child: Container(
                        width: 305,
                        padding: const EdgeInsets.only(left: 25, right: 13),
                        height: 55,
                        // width: double.maxFinite,
                        decoration: BoxDecoration(
                            // color: Colors.red,
                            borderRadius: BorderRadius.circular(40)),
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
                                Text(
                                  "Your Current Location",
                                  style: Theme.of(context).textTheme.titleSmall,
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
                                  size: 28,
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
                child: Container(
                  height: MediaQuery.sizeOf(context).height * .6,
                  color: Colors.amber,
                  child: const Center(
                    child: Text(
                      "Home Page",
                      style: TextStyle(fontSize: 25),
                    ),
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
                      // Container(
                      //   width: 210,
                      //   height: 167,
                      //  decoration: BoxDecoration(image: DecorationImage(
                      //   fit: BoxFit.cover,
                      //   image: AssetImage('assets/images/rapido1.jpg')),
                      //   color: Colors.red),

                      // ),

                      const Image(
                          height: 167,
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
