import 'package:flutter/material.dart';
import 'package:rapido/screens.dart/completeProfile.dart';
import 'package:rapido/screens.dart/myride.dart';
import 'package:rapido/screens.dart/notification.dart';

import 'package:rapido/screens.dart/payment.dart';
import 'package:rapido/screens.dart/profile.dart';
import 'package:rapido/screens.dart/rating.dart';

import 'package:rapido/screens.dart/rewards.dart';
import 'package:rapido/screens.dart/safety.dart';
import 'package:rapido/screens.dart/setting.dart';
import 'package:rapido/screens.dart/support.dart';
import 'package:rapido/screens.dart/textStyle.dart';

class drawer extends StatefulWidget {
  const drawer({
    super.key,
  });

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  List<Map<String, dynamic>> drawerItems = [
    {'title': 'Payment', 'page': const Payment()},
    {'title': 'My Rides', 'page': const Rides()},
    {'title': 'Safety', 'page': const Safety()},
    {'title': 'My Rewards', 'page': const Rewards()},
    {'title': 'Notifications', 'page': const Notifications()},
    {'title': 'Settings', 'page': const Setting()},
    {'title': 'Support', 'page': const Support()},
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    // double screenWidth = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        SizedBox(
          height: screenHeight*.82,
          child: ListView(
            children: [
              SizedBox(
                height: 110,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile()));
                  },
                  child: DrawerHeader(
                      decoration: const BoxDecoration(color: Colors.amber),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 15.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 25,
                              child: Icon(
                                Icons.person,
                                size: 32,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Vinay Kumar",
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              Text(
                                "+919315173557",
                                style: Theme.of(context).textTheme.labelSmall,
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Rating()));
                },
                leading: const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                title: Text(
                  "My Rating",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CompleteProfile()));
                },
                title: Text(
                  "Complete your profile",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: drawerItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  drawerItems[index]['page']));
                    },
                    leading: const CircleAvatar(),
                    title: Text(
                      drawerItems[index]['title'],
                      style: Style6,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Container(
          // height: 70,
          // color: Colors.red,
          width: double.infinity,
          decoration: const BoxDecoration(
              //  color: Colors.red,
              border: Border(top: BorderSide(width: 1, color: Colors.black))),
          padding: const EdgeInsets.only(left: 15, top: 10, right: 10,),
          child: ListTile(
            // tileColor: Colors.amber,
            contentPadding: const EdgeInsets.all(0),
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
            title: const Text(
              "Make more money!",
              style: TextStyle(fontSize: 20),
            ),
            subtitle: const Text(
              "Become a Captain",
              style: TextStyle(fontSize: 17),
            ),
          ),
        )
      ],
    );
  }
}
