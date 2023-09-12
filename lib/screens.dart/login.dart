import 'dart:developer';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
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
  _launchURL() async {
  Uri url = Uri.parse('https://www.google.com');
  if (await launchUrl(url)) {
    await launchUrl(
      url,
      mode: LaunchMode.inAppWebView);
  } else {
    throw 'Could not launch $url';
  }
}
  //  showError(String error){
  //   // setState(() {
  //   //   error = error;
  //   // });
  // return error;
  // }

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

  sendOTP() async {
    String number = '+91$phoneNo';
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: number,
        codeSent: (verificationId, forceResendingToken) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return OtpPage(
              number: number,
              id: verificationId,
            );
          }));
        },
        verificationCompleted: (phoneAuthCredential) {},
        verificationFailed: (error) {
          log(error.code.toString());
        },
        codeAutoRetrievalTimeout: (verificationId) {},
        timeout: const Duration(seconds: 30));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
                  Container(
                    // height: 50,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    // width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black26),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('+91'),
                        const SizedBox(
                          width: 7,
                        ),
                        Expanded(
                            child: Form(
                          key: _formkey,
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            autofocus: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              RegExp regExp = RegExp(pattern);
                              if (value!.isEmpty) {
                                // showError('*Please enter mobile number');
                                return '*Please enter mobile number';
                              } else if (!regExp.hasMatch(value)) {
                                // showError('*Please enter valid mobile number')
                                return '*Please enter valid mobile number';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              if (_formkey.currentState!.validate()) {
                                setState(() {
                                  isValid = !isValid;
                                });
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                phoneNo = value!;
                              });
                              print(phoneNo);
                            },
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                border: InputBorder.none,
                                hintText: "Enter phone number",
                                hintStyle: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black54,
                                )),
                          ),
                        ))
                      ],
                    ),
                  ),
                  // Text(error ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
            child: Column(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor:
                            isValid ? Colors.black : Colors.black26,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        fixedSize: const Size(double.maxFinite, 50),
                        backgroundColor:
                            isValid ? Colors.amber : Colors.grey.shade300),
                    onPressed: isValid?() {
                      _formkey.currentState?.save();
                      sendOTP();
                    }: null,
                    child: const Text(
                      "Proceed",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                      text: 'By continuing, you agree to our',
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 13),
                      children: [
                        TextSpan(
                          text: 'Terms of Service',
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap=_launchURL,
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: const TextStyle(
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()..onTap=
                            _launchURL,
                          
                        )
                      ]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
