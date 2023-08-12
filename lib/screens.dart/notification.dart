import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
            // collapsedHeight: 140,
            // floating: true,
            pinned: true,
            expandedHeight: 220,
            flexibleSpace: const FlexibleSpaceBar(
              background: Align(
                  // heightFactor: .9,
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.black38,
                        size: 120,
                      ))),
              // centerTitle: true,
              // collapseMode: CollapseMode.pin,
              title: Align(
                // widthFactor: 1,
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Notifications",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            // child: Padding(
            //    padding: EdgeInsets.symmetric(horizontal: 10),
            //   // padding: const EdgeInsets.all(8.0),
            //   child: Card(
            //     child: Container(

            //         width: double.infinity,
            //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.amber.shade100),
            //         height: 80,
            //         child: Text("vin")
            //       ),
            //   ),
            // ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:10.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Container(
                      width: double.infinity,
                      // color: Colors.red,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      // height: 240,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5)),
                                color: Colors.red),
                            height: 160,
                            // color: Colors.black,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text("Chalo chalein mitwaa", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                              Text("Metro se kahin bhi drop kardein", style: TextStyle(fontSize: 18),),
                              Padding(
                                padding: EdgeInsets.only(top:5.0),
                                child: Text("5 hours ago"),
                              )],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
