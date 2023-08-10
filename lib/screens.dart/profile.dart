import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text("Vinay kumar"),
        // ),
        body: CustomScrollView(
          slivers: [
            // SliverFadeTransition(opacity: opacity)
            const SliverAppBar(
              actions: [
                Padding(
                  padding: EdgeInsets.only(right:8),
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
                      child: Text("Support", style: TextStyle(fontSize: 19),)),
                      SizedBox(width: 10,)
              ],
              // collapsedHeight: 140,
              // floating: true,
              pinned: true,
              expandedHeight: 220,
              flexibleSpace: FlexibleSpaceBar(
                  background: Align(
                      // heightFactor: .9,
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Icon(
                            Icons.person,
                            color: Colors.black38,
                            size: 150,
                          ))),
                          // centerTitle: true,
                          // collapseMode: CollapseMode.pin,
                          title: Align(
                            alignment: Alignment.bottomLeft,
                            child: Wrap(
                              children: [
                                Text("Vinay Kumar", style: TextStyle(color: Colors.black),),
                                // Text("+919315173557")
                              ],
                            ),
                          ),
                          ),
            ),
            SliverFillRemaining(
              child: Wrap(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Profile",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 10.0),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              leading: const CircleAvatar(
                                radius: 22,
                                child: Icon(Icons.mail),
                              ),
                              title: const Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red),
                              ),
                              subtitle: const Text(
                                'Required',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.info_outline)),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(0),
                              leading: CircleAvatar(
                                radius: 22,
                                child: Icon(Icons.person),
                              ),
                              title: Text("Gender",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  )),
                              subtitle: Text(
                                'Male',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(0),
                              leading: CircleAvatar(
                                radius: 22,
                                child: Icon(Icons.calendar_month_outlined),
                              ),
                              title: Text(
                                "Date of birth",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(
                                '5/5/2002',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(0),
                              leading: CircleAvatar(
                                radius: 22,
                                child: Icon(Icons.mail),
                              ),
                              title: Text(
                                "Member since",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(
                                'August 2023',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(0),
                              leading: CircleAvatar(
                                radius: 22,
                                child: Icon(Icons.shield),
                              ),
                              title: Text(
                                "Emergency contacts",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                'Share ride details with trusted contacts',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ]),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 0,
                    color: Colors.black26,
                  ),
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  top: 15.0, left: 15, bottom: 10),
                              child: Text(
                                "Others",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            ListTile(
                              onTap: () {},
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              leading: const CircleAvatar(
                                child: Icon(Icons.logout),
                              ),
                              title: const Text(
                                "Logout",
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text("We never post on your behalf",
                              style: TextStyle(fontSize: 18)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
