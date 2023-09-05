import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  List<Map<String, dynamic>> generalItems = [
    {'title': 'Profile', 'subtitle': '9315173557'},
    {'title': 'Favourites', 'subtitle': 'Manage favourite locations'},
    {'title': 'Preferences', 'subtitle': 'Manage preferences'},
    {'title': 'App Languages', 'subtitle': 'English'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
    
          slivers: [
            SliverAppBar(
              elevation: 0,
              actions: const[
                Padding(
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
                      style: TextStyle(fontSize: 19),
                    )),
                SizedBox(
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
                        child: Icon(
                          Icons.settings,
                          color: Colors.black38,
                          size: 130,
                        ))),
                // centerTitle: true,
                // collapseMode: CollapseMode.pin,
                title: Text(
                  "Settings",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
            SliverList.list(children: [
              Container(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "General",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          ListView.builder(
                            padding: const EdgeInsets.only(top: 8),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: generalItems.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                // tileColor: Colors.amber,
                                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                                onTap: () {},
                                leading: const CircleAvatar(
                                  radius: 25,
                                ),
                                title: Text(
                                  generalItems[index]['title']!,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                subtitle: Text(
                                  generalItems[index]['subtitle']!,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              );
                            },
                          ),
                        ]),
                  ),
                  const Divider(thickness: 2,height: 20,),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Others",style: Theme.of(context).textTheme.bodyLarge,),
                          ListView.builder(
                            padding: const EdgeInsets.only(top: 8),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: generalItems.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                                onTap: () {},
                                leading: const CircleAvatar(
                                  radius: 25,
                                ),
                                title: Text(
                                  generalItems[index]['title']!,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                subtitle: Text(
                                  generalItems[index]['subtitle']!,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  )
            ]),
            
          ],
        ),
      ),
    );
  }
}
