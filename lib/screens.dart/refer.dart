import 'package:flutter/material.dart';

class Refer extends StatefulWidget {
  const Refer({super.key});

  @override
  State<Refer> createState() => _ReferState();
}

class _ReferState extends State<Refer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leadingWidth: 40,
          // toolbarHeight: 120,
          leading: Padding(
            padding: const EdgeInsets.only(left:12.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: Icon(Icons.arrow_back,color: Colors.black,),),
          ),
          centerTitle: true,
          title: Text("Refer Friends"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right:12.0,),
              child: Row(
                children: [Icon(Icons.question_mark, size: 20,),
                Text("FAQs")],
              ),
            )
          ]),
          body: Container(height: 200,color: Colors.amber,),
      ));
  }
}
