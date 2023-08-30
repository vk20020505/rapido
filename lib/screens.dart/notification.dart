import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<Map<String, String>> offers = [
    {
      'title': 'Chalo chalein mitwaa',
      'subtitle': "Metro se kahin bhi drop kardein",
      'time': '5 hours ago'
    },
     {
      'title': 'Chalo chalein mitwaa',
      'subtitle': "Metro se kahin bhi drop kardein",
      'time': '3 hours ago'
    },
     {
      'title': 'Chalo chalein mitwaa',
      'subtitle': "Metro se kahin bhi drop kardein",
      'time': '5 hours ago'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              flexibleSpace:  FlexibleSpaceBar(
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
                    style: Theme.of(context).textTheme.displayMedium
                    //  TextStyle(color: Colors.black,),
                  ),
                ),
              ),
            ),
            SliverList.list(
              children: [
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: offers.length,
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
                                  color: Colors.red,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/rapido2.jpg'))),
                              height: 160,
                              // color: Colors.black,
                            ),
                             Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text(
                                    offers[index]['title']!,
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                   offers[index]['subtitle']!,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Text(offers[index]['time']!,),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),]
            )
          ],
        ),
      ),
    );
  }
}
