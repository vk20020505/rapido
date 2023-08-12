import 'package:flutter/material.dart';
import 'package:rapido/screens.dart/bottomsheet.dart';
import 'package:rapido/screens.dart/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState>_globalKey = GlobalKey<ScaffoldState>();
  

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
                      child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 22,
                          child: Icon(
                            Icons.menu,
                            color: Colors.black,
                            size: 32,
                          )),
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
                                  style: TextStyle(fontSize: 17),
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
        // AppBar(
        //   elevation: 0,

        //   // leading:
        //   // Container(
        //   //   width: 10,
        //   //   height: 10,
        //   //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        //   //   color: Colors.white),
        //   //   child: Icon(Icons.menu, color: Colors.black,),
        //   // ),
        //   //  Padding(
        //   //   padding: EdgeInsets.only(left: 10),
        //   //    child: CircleAvatar(
        //   //      backgroundColor: Colors.white,
        //   //     //  radius: 20,
        //   //      child: Icon(Icons.menu, color: Colors.black,)
        //   //      ),
        //   //  ),
        //   // automaticallyImplyLeading: false,
        //   leadingWidth: 50,
        //   backgroundColor: Colors.transparent,
        //   toolbarHeight: 90,
        //   title: Card(
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(40)),
        //       elevation: 5,
        //       child: Container(
        //         padding: const EdgeInsets.only(left: 25, right: 13),
        //         height: 55,
        //         width: double.infinity,
        //         decoration:
        //             BoxDecoration(borderRadius: BorderRadius.circular(40)),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             const Row(
        //               children: [
        //                 Padding(
        //                   padding: EdgeInsets.only(right: 10),
        //                   child: CircleAvatar(
        //                     backgroundColor: Colors.green,
        //                     radius: 6,
        //                   ),
        //                 ),
        //                 Text(
        //                   "Your Current Location",
        //                   style: TextStyle(fontSize: 20),
        //                 )
        //               ],
        //             ),
        //             // Icon(Icons.favorite_outline_outlined,size: 28,),
        //             IconButton(
        //                 padding: const EdgeInsets.all(0),
        //                 onPressed: () {
        //                   favoriteLocation(context);
        //                 },
        //                 // favoriteLocation(context),
        //                 icon: const Icon(
        //                   Icons.favorite_outline_outlined,
        //                   size: 28,
        //                   color: Colors.black,
        //                 ))
        //           ],
        //         ),
        //       )),
        //   centerTitle: true,
        // ),
        body: Container(
          color: Colors.amber,
          child: const Center(
            child: Text(
              "Home Page",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
        drawer: Drawer(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            backgroundColor: Colors.white,
            child: const drawer()),
        bottomSheet: Container(
          height: MediaQuery.sizeOf(context).height * .4,
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
              // borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 6,
                        ),
                      ),
                      Text(
                        "Enter Drop Location",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              const Text(
                "Book ride now by searching for your drop location",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
