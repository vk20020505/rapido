import 'package:flutter/material.dart';
import 'package:rapido/screens.dart/parcel.dart';
import 'package:rapido/screens.dart/profile.dart';

class drawer extends StatelessWidget {
  const drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height - 100,
          child: ListView(
            children: [
               SizedBox(
                height: 100,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Profile()));
                  },
                  child: const DrawerHeader(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
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
                                "Vinay kumar",
                                style: TextStyle(
                                  fontSize: 21,
                                ),
                              ),
                              Text("+919315173557")
                            ],
                          )
                        ],
                      )),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                title: const Text(
                  "My Rating",
                  style: TextStyle(fontSize: 18),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ),
              ListTile(
                onTap: () {},
                title: const Text(
                  "Complete your profile",
                  style: TextStyle(fontSize: 19),
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
                onTap: () {},
                leading: const CircleAvatar(),
                title: const Text(
                  "Payments",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const CircleAvatar(),
                title: const Text(
                  "My Rides",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const CircleAvatar(),
                title: const Text(
                  "Safety",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const CircleAvatar(),
                title: const Text(
                  "Refer and Earn",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const CircleAvatar(),
                title: const Text(
                  "My Rewards",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const CircleAvatar(),
                title: const Text(
                  "Rapido Coins",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const CircleAvatar(),
                title: const Text(
                  "Power Pass",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const CircleAvatar(),
                title: const Text(
                  "Notification",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const CircleAvatar(),
                title: const Text(
                  "Claims",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const CircleAvatar(),
                title: const Text(
                  "Settings",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                onTap: () {},
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
