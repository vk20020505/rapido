import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 140,
            title: Text("Orders", style: TextStyle(fontSize: 35),),
          //  automaticallyImplyLeading: false,
          //  leading: Icon(Icons.arrow_back),
            bottom: TabBar(
              labelColor: Colors.black,
              labelStyle: TextStyle(fontSize: 23),
              labelPadding: EdgeInsets.only(bottom: 15),
              indicatorColor: Colors.black,
              tabs: [
              Text(
                "Rides",
                // style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                "Parcel",
                //  style: Theme.of(context).textTheme.labelMedium,
              )
            ]),
          ),
          body: TabBarView(children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.red,
            ),
             Container(
              height: 100,
              width: double.infinity,
              color: Colors.blue,
            )
          ]),
        ),
      ),
    );
  }
}
