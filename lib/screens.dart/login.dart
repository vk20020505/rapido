import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<Map<String, String>> sliderContents = [
    {'image': 'assets/images/rapido2.jpg'},
    {'image': 'assets/images/rapido1.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // height: 220,
            color: Colors.yellow,
            child: Stack(
              children: [
                
                CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(
                    pauseAutoPlayInFiniteScroll: true,
                      height: 200.0,
                      viewportFraction: 1,
                      autoPlay: true,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                  items: sliderContents.map(
                    (data) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          // child: Icon(Icons.access_time_rounded),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(data['image']!),
                            fit: BoxFit.cover
                            
                          )),
                        );
                      });
                    },
                  ).toList(),
                ),
                const Positioned(
                  top: 17,
                  right: 10,
                  child: Icon(Icons.info_outline)),

                  Positioned(
                    bottom: 15,
                    right: 10,
                    child:   Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: sliderContents.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 6.0,
                                height: 6.0,
                                margin: const EdgeInsets.symmetric(
                                     horizontal: 2.0),
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
                        ),)
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
              child: Stack(
                // alignment: Alignment.bottomCenter,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Let's get started",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                        child: Text(
                          "Verify your account using OTP",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.phone,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                            // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black54)  ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black54)),
                            contentPadding: EdgeInsets.all(13),
                            prefix: Text('+91  '),
                            // prefixText: "+91   ",
                            prefixStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                            hintText: "Enter phone number",
                            hintStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.black54,
                            )),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 5,
                    child: Column(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                fixedSize: const Size(double.maxFinite, 50),
                                backgroundColor: Colors.amber),
                            onPressed: () {},
                            child: const Text(
                              "Proceed",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            )),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            "By continuing, you agree to our Terms of Service and Privacy Policy",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13, color: Colors.black54),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          // Column(
          //   children: [
          //     ElevatedButton(
          //       style: ElevatedButton.styleFrom(
          //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          //         fixedSize: Size(double.maxFinite, 60),
          //         backgroundColor: Colors.amber),
          //       onPressed: (){}, child: Text("Proceed", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),)),

          //       Text(

          //         "By continuing, you agree to our Terms of Service and Privacy Policy",
          //         textAlign: TextAlign.center,
          //         style: TextStyle(color: Colors.black54),)
          //   ],
          // )
        ],
      ),
      // floatingActionButton: Center(
      //   child: FloatingActionButton(onPressed: (){},
      //   materialTapTargetSize: MaterialTapTargetSize.padded,
      //   isExtended: true,
      //     child: Column(
      //                   children: [
      //                     ElevatedButton(
      //                         style: ElevatedButton.styleFrom(
      //                           elevation: 0,
      //                             shape: RoundedRectangleBorder(
      //                                 borderRadius: BorderRadius.circular(8)),
      //                             fixedSize: const Size(double.maxFinite, 50),
      //                             backgroundColor: Colors.amber),
      //                         onPressed: () {},
      //                         child: const Text(
      //                           "Proceed",
      //                           style: TextStyle(
      //                               fontSize: 17,
      //                               fontWeight: FontWeight.w600,
      //                               color: Colors.black),
      //                         )),
      //                     const Padding(
      //                       padding: EdgeInsets.only(top: 10.0),
      //                       child: Text(
      //                         "By continuing, you agree to our Terms of Service and Privacy Policy",
      //                         textAlign: TextAlign.center,
      //                         style: TextStyle(fontSize: 13, color: Colors.black54),
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //   ),
      // ),
    ));
  }
}
