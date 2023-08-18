import 'package:flutter/material.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              // automaticallyImplyLeading: false,
              centerTitle: true,
              pinned: true,
              expandedHeight: 220,
              flexibleSpace: FlexibleSpaceBar(
                background: const Align(
                    // heightFactor: .9,
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Icon(
                          Icons.person,
                          color: Colors.black38,
                          size: 150,
                        ))),
                title: Text("Complete your profile",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    // textAlign:TextAlign.left,
                    style: Theme.of(context).textTheme.displayMedium),
              ),
            ),
            SliverFillRemaining(
                child: Wrap(
                  // padding: EdgeInsets.symmetric(vertical: 0),
                  children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("What's pending?"),
                    ListView.builder(
                      padding: EdgeInsets.only(top: 10),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return const ListTile(
                          // tileColor: Colors.red,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          title: Text("Email Address"),
                          trailing: Icon(Icons.done),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Completed"),
                    ListView.builder(
                      padding: EdgeInsets.only(top: 10),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) {
                        return const ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          title: Text("Email Address"),
                          trailing: Icon(Icons.done),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ])),
          ],
        ),
      ),
    );
  }
}
