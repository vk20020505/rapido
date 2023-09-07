import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rapido/screens.dart/otp.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

   final _formkey = GlobalKey<FormState>();
   bool isValid = false;

  int _current = 0;
  final CarouselController _controller = CarouselController();

  String? phoneNo;
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

  List<Map<String, String>> sliderContents = [
    {'image': 'assets/images/rapido2.jpg'},
    {'image': 'assets/images/rapido1.jpg'},
  ];

  // showdialog(String text) {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return  Center(
  //             child: SizedBox(
  //           height: 255,
  //           child: AlertDialog(
  //             content: Text(text),
  //           ),
  //         ));
  //       });
  // }

  @override
  Widget build(BuildContext context) {

    bool showButton = MediaQuery.of(context).viewInsets.bottom == 0;
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
                                  fit: BoxFit.cover)),
                        );
                      });
                    },
                  ).toList(),
                ),
                const Positioned(
                    top: 17, right: 10, child: Icon(Icons.info_outline)),
                Positioned(
                  bottom: 15,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: sliderContents.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 6.0,
                          height: 6.0,
                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
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
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                right: 20,
                left: 20,
              ),
              child: Column(
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
                  Form(
                       key: _formkey,
                    child: TextFormField(
                      autofocus: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        RegExp regExp =  RegExp(pattern);
                        if (value!.isEmpty) {
                          return '*Please enter mobile number';
                         
                        } else if (!regExp.hasMatch(value)) {
                          return '*Please enter valid mobile number';
                         
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if(_formkey.currentState!.validate())
                          {
                            setState(() {
                              isValid = !isValid ;
                            });
                          }
                      },
                      onSaved: (value) {
                        setState(() {
                          phoneNo = value!;
                        });
                         print(phoneNo);
                      },
                      // keyboardAppearance: ,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                          // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black54)  ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
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
                    ),
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: showButton,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // disabledBackgroundColor: Colors.black26 ,
                        // disabledForegroundColor: Colors.black38,
                        foregroundColor: isValid? Colors.black: Colors.black38,
                        // enabledMouseCursor: MouseCursor.uncontrolled,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          fixedSize: const Size(double.maxFinite, 60),
                          backgroundColor: isValid? Colors.amber :Colors.black12 ),
                      onPressed: () {
                          // if(_formkey.currentState!.validate())
                          // {
                            _formkey.currentState?.save();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const OtpPage()))
                               ;
                              
                      },
                      child: const Text(
                        "Proceed",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                             ),
                      )),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10),
                    child: Text(
                      "By continuing, you agree to our Terms of Service and Privacy Policy",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
