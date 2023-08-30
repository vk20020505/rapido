import 'package:flutter/material.dart';

class Rides extends StatefulWidget {
  const Rides({super.key});

  @override
  State<Rides> createState() => _RidesState();
}

class _RidesState extends State<Rides> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 100,
          title: const Text("Rides", style: TextStyle(fontSize: 35)),  
        ),
        body: Container(
          color: Colors.red,
          height: 100,
        )
      ),
    );
  }
}
