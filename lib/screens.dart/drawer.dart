// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:rapido/screens.dart/completeProfile.dart';
import 'package:rapido/screens.dart/myride.dart';
import 'package:rapido/screens.dart/notification.dart';
import 'package:rapido/screens.dart/parcel.dart';
import 'package:rapido/screens.dart/payment.dart';
import 'package:rapido/screens.dart/profile.dart';
import 'package:rapido/screens.dart/rating.dart';
import 'package:rapido/screens.dart/refer.dart';
import 'package:rapido/screens.dart/rewards.dart';
import 'package:rapido/screens.dart/safety.dart';
import 'package:rapido/screens.dart/setting.dart';
import 'package:rapido/screens.dart/support.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  // List<Map<String, dynamic>> drawerItems = [
  //   {'title': 'Parcel-Send Items','page': const Parcel()},
  //   {'title': 'Payment','page': const Payment()},
  //   {'title': 'My Rides','page': MyRides()},
  //   {'title': 'Safety','page': const Safety()},
  //   {'title': 'Refer and Earn','page': ReferandEarn()},
  //   {'title': 'My Rewards','page': Reward()},
  //   {'title': 'Rapido Coins','page': Coin()},
  //   {'title': 'Power Pass','page': Powerpass()},
  //   {'title': 'Notifications','page': Notifications()},
  //   {'title': 'Claims','page': Claims()},
  //   {'title': 'Settings','page': Setting()},
  //   {'title': 'Support','page': Support()},
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height - 100,
          child: ListView(
            children: [
               SizedBox(
                height: 110,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Profile()));
                  },
                  child: DrawerHeader(
                    decoration: const BoxDecoration(color: Colors.amber),
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 15.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 30,
                              child: Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vinay Kumar",
                                style: Theme.of(context).textTheme.titleMedium
                              ),
                              Text("+919315173557",style: Theme.of(context).textTheme.labelSmall,)
                            ],
                          )
                        ],
                      )),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Rating()));
                }
                ,
                leading: const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                title:  Text(
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const CompleteProfile()));
                },
                title:  Text(
                  "Complete your profile",
                  style:Theme.of(context).textTheme.titleMedium,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ),
              // 
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Parcel()));
                },
                leading: const CircleAvatar(),
                title: const Text(
                  "Parcel-Send Items",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Payment()));
                },
                leading: const CircleAvatar(),
                title: const Text(
                  "Payments",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                onTap: () {  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Order()));},
                leading: const CircleAvatar(),
                title: const Text(
                  "My Rides",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Safety()));
                },
                leading: const CircleAvatar(),
                title: const Text(
                  "Safety",
                  style: TextStyle(fontSize: 18),
                ),
              ),
           
              ListTile(
                onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const Rewards()));
                },
                leading: const CircleAvatar(),
                title: const Text(
                  "My Rewards",
                  style: TextStyle(fontSize: 18),
                ),
              ),
           
              
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Notifications()));
                },
                leading: const CircleAvatar(),
                title: const Text(
                  "Notification",
                  style: TextStyle(fontSize: 18),
                ),
              ),
             
              ListTile(
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const Setting()));
                },
                leading: const CircleAvatar(),
                title: const Text(
                  "Settings",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Support()));
                },
                leading: const CircleAvatar(),
                title: const Text(
                  "Support",
                  style: TextStyle(fontSize: 18),
                ),
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
          padding: const EdgeInsets.only(left: 15, top: 10, right: 10),
          child: ListTile(
            contentPadding: const EdgeInsets.all(0),
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Divider(thickness: 1,height: 0,color: Colors.black,),
                Text(
                  "Make more money!",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Become a Captain",
                  style: TextStyle(fontSize: 17),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
