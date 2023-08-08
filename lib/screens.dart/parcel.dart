import 'package:flutter/material.dart';
import 'package:rapido/screens.dart/drawer.dart';

class Parcel extends StatefulWidget {
  const Parcel({super.key});

  @override
  State<Parcel> createState() => _ParcelState();
}

class _ParcelState extends State<Parcel> {
  GlobalKey<ScaffoldState>_globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        key: _globalKey,
        drawer: Drawer(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            backgroundColor: Colors.blue.shade100,
            child:const drawer()
            ),
            appBar: PreferredSize(
              preferredSize: Size(double.infinity,150),
              child: Container(
                height: 130,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        child: InkWell(
                          onTap: () {
                            _globalKey.currentState!.openDrawer();
                          },
                          child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25,
                              child: Icon(
                                Icons.menu,
                                color: Colors.black,
                                size: 32,
                              )),
                        ),
                      ),
                    Text("Parcel", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                    CircleAvatar(backgroundColor: Colors.amber,radius: 15,child: Icon(Icons.question_mark, size: 20,color: Colors.black,),)
                  ],
                  
              
                          ),
              ),),

            body: Column(
              children: [
                Container(
                  height: 220,
                  color: Colors.red.shade200,
                  // child: Text("vinay"),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.white,
                    child: Column(
                      children: [],
                    ),
                  )
              ],
            ),
        
      ),
    );
  }
}