import 'package:flutter/material.dart';

class Rewards extends StatefulWidget {
  const Rewards({super.key});

  @override
  State<Rewards> createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
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
                    style: Theme.of(context).textTheme.labelMedium,
                  )),
              SizedBox(
                width: 10,
              )
            ],
            pinned: true,
            expandedHeight: 220,
            flexibleSpace: FlexibleSpaceBar(
              background: Align(
                  alignment: Alignment(-.51, .9),
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text("0 coins earned from scratch card"))),
              title: Align(
                alignment: Alignment(-2, .7),
                child: Text("My Rewards",
                    // textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.displayMedium),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Wrap(
                children: [
                  InkWell(
                      onTap: () {},
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.amber),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
