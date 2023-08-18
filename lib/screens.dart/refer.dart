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
          foregroundColor: Colors.white,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leadingWidth: 50,
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
                children: [Icon(Icons.question_mark, size: 20,color: Colors.white,),
                Text("FAQs")],
              ),
            )
          ]),
          body:
              Container(height: 250,
              width: double .infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/rapido2.jpg'),
                fit: BoxFit.cover)
              ),
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Text("Invite your friends to try Rapido",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  Container(height: 100,width: 250,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),)
                ],
              ),
              ),
              
            
          
      ));
  }
}
