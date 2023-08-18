import 'package:flutter/material.dart';

class Email extends StatefulWidget {
  const Email({super.key});

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
              backgroundColor: Colors.black, foregroundColor: Colors.yellow,
              fixedSize: Size(150, 60)),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Icon(Icons.check_box), Text("Save")])),
      body: CustomScrollView(
        slivers: [
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
              const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Support",
                    style: TextStyle(fontSize: 19),
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
                      child: Icon(
                        Icons.person_add_alt,
                        color: Colors.black38,
                        size: 150,
                      ))),
              // centerTitle: true,
              // collapseMode: CollapseMode.pin,
              title: Align(
                // widthFactor: 1,
                alignment: const Alignment(-1.45, 1),
                child: Text(
                  " Edit Email",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                cursorHeight: 25,
                // contextMenuBuilder: ,
                decoration: InputDecoration(hintText: 'Email'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
