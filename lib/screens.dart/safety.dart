import 'package:flutter/material.dart';

class Safety extends StatefulWidget {
  const Safety({super.key});

  @override
  State<Safety> createState() => _SafetyState();
}

class _SafetyState extends State<Safety> {
  List<Map> tabs = [
    {
      'title': "24X7 Proactive Safety Checks",
      'content': 'We send notifications and follow up calls in case of:'
    },
    {
      'title': "24X7 Call masking",
      'content':
          "We keep the identity and contact number of women customers confidential from Captains"
    },
     {
      'title': "SOS button",
      'content':
          "A button that calls our Central Emergency Response Team who then guide you to onground help"
    },
     {
      'title': "Late night ride completion",
      'content':
          "We call you post ride completion for feedback, each time you ride between 10pm - 5am"
    },
     {
      'title': "Trip Insurance",
      'content':
          "From start to finish, all trips are insured by leading insurance players"
    },
     
  ];

   List<Map> tabs2 = [
    {
      'title': "Helmets always",
      'content': 'We send notifications and follow up calls in case of:'
    },
    {
      'title': "Live location sharing",
      'content':
          "We keep the identity and contact number of women customers confidential from Captains"
    },
     {
      'title': "Your ride. Your rules",
      'content':
          "A button that calls our Central Emergency Response Team who then guide you to onground help"
    },
     {
      'title': "Add trusted contacts",
      'content':
          "We call you post ride completion for feedback, each time you ride between 10pm - 5am"
    },
     {
      'title': "Always share feedback",
      'content':
          "From start to finish, all trips are insured by leading insurance players"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.close,
              size: 23,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                color: Colors.blue.shade100,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Safety all the way",
                      style: TextStyle(fontSize: 25, color: Colors.blue),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 15),
                      child: Text(
                        "At rapido, your safety comes first. Here are some measures and provisions to ensure your safety, every time",
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                    Container(
                        width: double.maxFinite,
                        // height: 100,
                        padding:
                            const EdgeInsets.symmetric(horizontal: 18, vertical: 23),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue.shade50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "What we offer?",
                              style: TextStyle(fontSize: 23),
                            ),
                            ListView.separated(
                              padding: EdgeInsets.only(top:13),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: tabs.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider(
                                  thickness: 2,
                                );
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  // decoration: BoxDecoration(border: Border.all(width: 2)),
                                  // height: 200,
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom:12.0,),
                                        child: Row(
                                          children: [
                                            const CircleAvatar(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(left: 15.0),
                                              child: Text(
                                                tabs[index]['title'],
                                                // maxLines: 2,
                                                // overflow: TextOverflow.fade,
                                                // softWrap: true,
                                                style: const TextStyle(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Text(tabs[index]['content'],
                                      style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500),)
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        )),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:15.0),
                          child: Text("Please note,all these safety features only work in case of an online ride through our app.Do not accept offline rides", 
                          style: TextStyle(
                            height: 1.2,
                            fontSize: 20, color: Colors.blue,fontWeight: FontWeight.w500),),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical:10.0,horizontal: 8),
                          child: Text("THINGS YOU CAN DO",style: TextStyle(fontSize: 25, color: Colors.blue,fontWeight: FontWeight.w500),),
                        ),
                            ListView.separated(
                              padding: EdgeInsets.only(top:13),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: tabs2.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider(
                                  thickness: 2,
                                );
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  // decoration: BoxDecoration(border: Border.all(width: 2)),
                                  // height: 200,
                                  padding:  EdgeInsets.symmetric(vertical: 12,horizontal:10 ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom:12.0,),
                                        child: Row(
                                          children: [
                                            const CircleAvatar(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(left: 15.0),
                                              child: Text(
                                                tabs2[index]['title'],
                                                // maxLines: 2,
                                                // overflow: TextOverflow.fade,
                                                // softWrap: true,
                                                style: const TextStyle(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Text(tabs2[index]['content'],
                                      style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500),)
                                    ],
                                  ),
                                );
                              },
                            ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
