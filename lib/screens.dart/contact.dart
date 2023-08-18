import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
           SliverAppBar(
            actions: const [
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
                    style: TextStyle(fontSize: 18),
                  )),
              SizedBox(
                width: 10,
              )
            ],
          
            pinned: true,
            expandedHeight: 220,
            flexibleSpace: FlexibleSpaceBar(
              background: const Align(
                  // heightFactor: .9,
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Icon(
                        Icons.shield,
                        color: Colors.black38,
                        size: 110,
                      ))),
              
              title: Align(
                alignment:  const Alignment(-2.8, .95),
                child: Text(
                   
                  "Emergency Contacts",
                  // textAlign:TextAlign.left,
                  style: Theme.of(context).textTheme.bodyMedium
                ),
              ),
            ),
          ),
           SliverToBoxAdapter(
            child: Padding(padding: EdgeInsets.all(20),
            child: Column(
              children: [
                 SizedBox(height: 100,),
                Text("Share your trip status with family and friends in case of emergency",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(height: 80,),
                TextButton(
                  style: TextButton.styleFrom(side: BorderSide(width: 2,color:Colors.deepPurple ),
                  shape: StadiumBorder(),
                  padding: EdgeInsets.all(20)),
                  onPressed: (){}, child: Text('ADD EMERGENCY CONTACTS',style: GoogleFonts.lato(color:Colors.deepPurple ), ))
              ],
            ),)
          )
        ],
      ),
    );
  }
}