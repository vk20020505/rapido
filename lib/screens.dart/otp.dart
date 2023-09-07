import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          actions: [  Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 12,
                      child: Icon(
                        Icons.question_mark,
                        size: 18,
                        color: Colors.yellow,
                      )),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Help",
                      style: TextStyle(fontSize: 19)
                    )),
                SizedBox(
                  width: 10,
                )],
        ),
        bottomSheet:Container(),
      ),
    );
  }
}