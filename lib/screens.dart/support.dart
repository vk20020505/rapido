import 'package:flutter/material.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
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
                title: Text("Support",
                    // maxLines: 1,
                    // overflow: TextOverflow.ellipsis,
                    // textAlign:TextAlign.left,
                    style: Theme.of(context).textTheme.displayMedium),
              ),
            ),
            SliverFillRemaining(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Wrap(
                children: [
                  const Card(
                    shape: StadiumBorder(),
                    elevation: 5,
                    child: ListTile(
                      // contentPadding: EdgeInsets.only(left: 20),
                      leading: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.search_rounded,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      title: Text(
                        "Search Issue",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 5, bottom: 15),
                    child: Text(
                      "FAQs",
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                   
                  Card(child: Container(height: 300,width: double.infinity,color: Colors.amber,))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
