import 'package:flutter/material.dart';
import 'package:rapido/screens.dart/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Parcel extends StatefulWidget {
  const Parcel({super.key});

  @override
  State<Parcel> createState() => _ParcelState();
}

class _ParcelState extends State<Parcel> {
  int _current = 0;
  CarouselController _controller = CarouselController();
  List<Map<String, dynamic>> sliderContents = [
    {
      'title': 'Watch the weight',
      'subtitle': 'Maximum allowed weight per order is 5kgs',
      'icons': const Icon(Icons.person)
    },
    {
      'title': 'Cash payment available',
      'subtitle': 'Cash payment is available at both pickups or drop locations',
      'icons': const Icon(Icons.person)
    },
    {
      'title': "We don't purchase",
      'subtitle': "Our captains won't pay and buy items on your behalf",
      'icons': const Icon(Icons.person)
    }
  ];

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        drawer: Drawer(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            backgroundColor: Colors.blue.shade100,
            child: const drawer()),
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 150),
          child: Container(
            height: 130,
            color: Colors.red.shade200,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
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
                const Text(
                  "Parcel",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 15,
                  child: Icon(
                    Icons.question_mark,
                    size: 20,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StatefulBuilder(
                builder: (BuildContext context, setState) {
                  return Container(
                    // height: 153,
                    padding: const EdgeInsets.only(bottom: 8),
                    width: double.infinity,
                    color: Colors.red.shade200,
                    // child: Text("vinay"),
                    child: Column(
                      children: [
                        CarouselSlider(
                          carouselController: _controller,
                          options: CarouselOptions(
                              height: 115.0,
                              viewportFraction: 1,
                              // autoPlay: true,
                              enableInfiniteScroll: false,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              }),
                          items: sliderContents.map((data) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7)),
                                    child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 270,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(data['title'],
                                                      style: const TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    data['subtitle'],
                                                    style: const TextStyle(
                                                        fontSize: 17,
                                                        height: 1.4),
                                                    maxLines: 2,
                                                  )
                                                ],
                                              ),
                                            ),
                                            CircleAvatar(
                                              radius: 32,
                                              backgroundColor:
                                                  Colors.red.shade200,
                                            )
                                          ],
                                        )),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: sliderContents.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 9.0,
                                height: 9.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black)
                                        .withOpacity(
                                            _current == entry.key ? 0.9 : 0.4)),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Container(
                // padding: const EdgeInsets.symmetric(vertical:15,horizontal: 13),
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                         padding: const EdgeInsets.symmetric(vertical:15,horizontal: 13),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            width: 30,
                            height: 125,
                            // decoration: BoxDecoration(border: Border.all(width:2)),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [CircleAvatar(backgroundColor: Colors.green,),
                              SizedBox(
                                height: 31,child: VerticalDivider(thickness:1,color: Colors.black,indent: 0,endIndent: 0,)),
                              CircleAvatar(backgroundColor: Colors.red,)],
                            )),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Pickup From",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      height: 40,
                                      child: const Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 15.0),
                                            child: Icon(
                                              Icons.add_circle_rounded,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          Text(
                                            "Add details(Eg. Flat no,contact)",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      "Deliver To",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                        Container(
                                          // decoration: BoxDecoration(border: Border.all(width: 1)),
                                      margin: const EdgeInsets.only(bottom: 10),
                                      height: 40,
                                      child: const Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 15.0),
                                            child: Icon(
                                              Icons.add_circle_rounded,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          Text(
                                            "Add details(Eg. Flat no,contact)",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(thickness: 2,height: 0,),
                    Container(
                      height: 170,
                      padding: const EdgeInsets.all(20),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.gif_box),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Row(
                                children: [Text("Package Type",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)), Padding(
                                  padding: EdgeInsets.only(left:13),
                                  child: Icon(Icons.info_outline_rounded),
                                )],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(thickness: 2,),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text("By continuing, you agree to our T&C and there no restricted items in the package. Rapido shall not be liable for any theft/loss/misplacement "),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:17.0, right: 17,bottom: 15),
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            backgroundColor: Colors.amber, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                          onPressed: (){}, child: const Text("Continue", style: TextStyle(fontSize: 22,color: Colors.black),))),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
