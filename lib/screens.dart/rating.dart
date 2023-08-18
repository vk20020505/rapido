import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  const Rating({super.key});

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
    List<Map> tabs = [
    {
      'title': "Know your Captain",
      'content': "Knowing a litte more about the things that effects a captain's happiness can help you be a 5 star rider"
    },
    {
      'title': "Timely",
      'content':
          "Check your pick up address and make sure that it is accurate. Reach the pickup spot on time"
    },
     {
      'title': "Safety",
      'content':
          "Strap on your helmet and relax. Every Captain and Rider should follow the traffic rules all times "
    },
     {
      'title': "Courtesy",
      'content':
          "A smile or a 'Hello' go a long way! Treat your Captain just how you would like ot be treated"
    },
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
        children: [
          const Text("My Rating"),
          const SizedBox(width: 20,),
          Container(
            width: 75,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black26),
              borderRadius: BorderRadius.circular(28)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.star, color: Colors.amber,),SizedBox(width: 5,) ,Text('5')],
            ),
          )
        ],
      ),),
      body: ListView(
        children: [
          const Image(
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
            image: AssetImage('assets/images/rapido2.jpg')),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("How is your rating calculated?", style:Theme.of(context).textTheme.labelMedium ,
                
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:14.0),
                  child: Text("Rating is calculated as an average of all your past rating and is measured out of 5 stars. ", 
                  style: Theme.of(context).textTheme.bodySmall,),
                ),
                Text("Understanding Rating", style: Theme.of(context).textTheme.labelMedium ,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:15.0),
                  child: Text("To foster mutual respect Rapido captains and customers can rate each other on a scale of 1-5. ", 
                  style: Theme.of(context).textTheme.bodySmall,),
                ),
                 ListView.builder(
                              padding: const EdgeInsets.symmetric(vertical:15,),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: tabs.length,
                            
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  // decoration: BoxDecoration(border: Border.all(width: 2)),
                                  // height: 200,
                                  padding:  const EdgeInsets.symmetric(vertical: 12 ),
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
                                                style:Theme.of(context).textTheme.bodyMedium 
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Text(tabs[index]['content'],
                                      style:Theme.of(context).textTheme.labelSmall ,)
                                    ],
                                  ),
                                );
                              },
                            ),
              ],),
            )
        ],
      ),
    );
  }
}