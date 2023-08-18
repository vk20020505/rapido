import 'package:flutter/material.dart';
import 'package:rapido/screens.dart/contact.dart';
import 'package:rapido/screens.dart/email.dart';

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
            SliverAppBar(
              actions: [
                const Padding(
                  padding: EdgeInsets.only(right: 8),
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
                    child: Text(
                      "Support",
                      style: Theme.of(context).textTheme.labelMedium,
                    )),
                const SizedBox(
                  width: 10,
                )
              ],
              // collapsedHeight: 140,
              // floating: true,
              pinned: true,
              expandedHeight: 220,
              flexibleSpace: FlexibleSpaceBar(
                background: const Align(
                    // heightFactor: .9,
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Stack(
                          // direction: Axis.vertical,
                          // crossAxisAlignment: WrapCrossAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // textDirection: TextDirection.values(),
                          children: [
                            Positioned(
                              top: 40,
                              left: 110,
                              child: Icon(
                                Icons.person,
                                color: Colors.black26,
                                size: 150,
                              ),
                            ),
                            Positioned(
                                bottom: 5,
                                left: 50,
                                //  alignment: Alignment(-1,.95),
                                child: Text("9943982485"))
                          ],
                        ))),
                // centerTitle: true,
                // collapseMode: CollapseMode.pin,
                title: Align(
                  alignment: const Alignment(-1.55, .75),
                  child: Text(
                    "Vinay Kumar",
                    style: Theme.of(context).textTheme.displayMedium,
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
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Email()));
                              },
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
                                    color: Colors.blue),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: ListTile(
                              onTap: () {
                                showDialog(
                                    // useRootNavigator: false,
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: SizedBox(
                                          height: 280,
                                          child: AlertDialog(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10),
                                            titleTextStyle: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 20),
                                            title: const Text(
                                                "Select your gender"),
                                            contentTextStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 25),
                                            content: Column(
                                                // mainAxisSize: Size(),
                                                children: [
                                                  Card(
                                                      // color: Colors.red,
                                                      elevation: 0,
                                                      margin:
                                                          const EdgeInsets.all(
                                                              0),
                                                      child: ListTile(
                                                        onTap: () {},
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .all(0),
                                                        leading: const Icon(
                                                          Icons.male,
                                                          size: 40,
                                                        ),
                                                        title: const Text(
                                                          'Male',
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      )),
                                                  Card(
                                                      // color: Colors.red,
                                                      margin:
                                                          const EdgeInsets.all(
                                                              0),
                                                      elevation: 0,
                                                      child: ListTile(
                                                        onTap: () {},
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .all(0),
                                                        leading: const Icon(
                                                          Icons.female,
                                                          size: 40,
                                                        ),
                                                        title: const Text(
                                                          'Female',
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      )),
                                                  Card(
                                                      // color: Colors.red,
                                                      margin:
                                                          const EdgeInsets.all(
                                                              0),
                                                      elevation: 0,
                                                      child: ListTile(
                                                        onTap: () {},
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .all(0),
                                                        leading: const Icon(
                                                          Icons
                                                              .transgender_outlined,
                                                          size: 40,
                                                        ),
                                                        title: const Text(
                                                          'Other',
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ))
                                                ]),
                                          ),
                                        ),
                                      );
                                    });
                              },
                              contentPadding: const EdgeInsets.all(0),
                              leading: const CircleAvatar(
                                radius: 22,
                                child: Icon(Icons.person),
                              ),
                              title: const Text("Gender",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  )),
                              subtitle: const Text(
                                'Male',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: ListTile(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const Center(
                                          child: SizedBox(
                                        height: 255,
                                        child: AlertDialog(
                                          content: Text("vinay"),
                                        ),
                                        // child: DatePickerDialog(initialDate: initialDate, firstDate: firstDate, lastDate: lastDate),
                                      ));
                                    });
                              },
                              contentPadding: const EdgeInsets.all(0),
                              leading: const CircleAvatar(
                                radius: 22,
                                child: Icon(Icons.calendar_month_outlined),
                              ),
                              title: const Text(
                                "Date of birth",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: const Text(
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Contacts()));
                              },
                              contentPadding: const EdgeInsets.all(0),
                              leading: const CircleAvatar(
                                radius: 22,
                                child: Icon(Icons.shield),
                              ),
                              title: const Text(
                                "Emergency contacts",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              subtitle: const Text(
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
