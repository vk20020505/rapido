import 'dart:async';
import 'dart:developer';
// import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinput/pinput.dart';
import 'package:rapido/screens.dart/email.dart';
import 'package:rapido/screens.dart/home.dart';
// import 'package:rapido/screens.dart/home.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key, required this.number, required this.id});
  final String? number;
  final String id;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer!.cancel();
  }

  final defaultPintheme = PinTheme(
    height: 60,
    width: 60,
    textStyle: const TextStyle(
      fontSize: 25,
      color: Colors.black,
    ),
    decoration: BoxDecoration(
        color: Colors.amber.shade300, borderRadius: BorderRadius.circular(7)),
  );
  Timer? timer;
  int countDown = 30;
  String? otp;

  resendOTP() {
    if (countDown == 0) {
      setState(() {
        countDown = 30;
      });
      startTimer();
    }
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (countDown > 0) {
          countDown--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  verifyOTP() async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: widget.id, smsCode: otp!);

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

          if(userCredential.user != null){
               Navigator.push(context, MaterialPageRoute(builder: (context){
            return HomeScreen();
        }));
          }
    } on FirebaseAuthException catch (error) {
      log(error.code.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 90,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleQuestion,
                    size: 23,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Help", style: TextStyle(fontSize: 19)),
                ],
              ),
            )
          ],
        ),
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              Container(
                height: 70,
                color: Colors.amber,
              ),
              Positioned(
                width: screenWidth,
                top: 40,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 60, right: 20, left: 20, bottom: 20),
                  height: screenHeight * .8,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter the OTP",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0, bottom: 30),
                        child: Text(
                          "We have sent an OTP to ${widget.number} ",
                          style: const TextStyle(
                              fontSize: 17, color: Colors.black45),
                        ),
                      ),
                      Pinput(
                        autofocus: true,
                        length: 6,
                        defaultPinTheme: defaultPintheme,
                        focusedPinTheme: defaultPintheme.copyWith(
                            decoration: defaultPintheme.decoration!.copyWith(
                                border: Border.all(color: Colors.black))),
                        onCompleted: (pin) {
                          otp = pin;
                        },
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('00:${countDown.toString()}'),
                            Row(
                              children: [
                                const Text(
                                  "Didn't receive otp? ",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black54),
                                ),
                                InkWell(
                                    onTap: () {
                                      resendOTP();
                                    },
                                    child: Text("Resend",
                                        style: TextStyle(
                                            color: countDown == 0
                                                ? Colors.black
                                                : Colors.black54)))
                              ],
                            ),
                          ],
                        ),
                      ),

                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            verifyOTP();
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(140, 40),
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.amber.shade300,
                              shape: const StadiumBorder()),
                          child: const Text('Verify OTP'),
                        ),
                      )

                      // ElevatedButton(onPressed: (){print(otp);}, child: Text("submit"))
                    ],
                  ),
                ),
              ),
              const Positioned(
                  top: 15,
                  left: 23,
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.red,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
