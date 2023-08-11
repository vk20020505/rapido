import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  List<Map<String, dynamic>> paymentMode = [
    {'title': 'Rapido Wallet', 'trailing': '0.0','icon':Icons.currency_rupee_outlined},
    {'title': 'AmazonPay', 'trailing': 'Link','icon':Icons.link},
    {'title': 'Paytm', 'trailing': 'Link','icon':Icons.link},
  ];
   List<Map<String, dynamic>> payLaterMode = [
    {'title': 'Lazypay','trailing': 'Link','icon':Icons.link},
    {'title': 'Simpl', 'trailing': 'Link','icon':Icons.link},
    {'title': 'Pay at Drop','subTitle':'Go cashless, after ride pay by scanning QR code'},
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
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
              background: Align(
                  // heightFactor: .9,
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Icon(
                        Icons.wallet,
                        color: Colors.black38,
                        size: 150,
                      ))),
              // centerTitle: true,
              // collapseMode: CollapseMode.pin,
              title: Align(
                // widthFactor: 1,
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Payment",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Personal Wallet",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: paymentMode.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    // tileColor: Colors.amber,
                    contentPadding: const EdgeInsets.all(10),
                    onTap: () {},
                    leading: const CircleAvatar(
                      radius: 25,
                    ),
                    title:  Text(
                      paymentMode[index]['title']!,
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing:  Container(
                      // decoration: BoxDecoration(border: Border.all(width: 1)),
                      width: 75,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: Icon(paymentMode[index]['icon'],color: Colors.blue,),
                          ),
                          Text(
                            paymentMode[index]['trailing']!,
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Pay Later",
                  style: TextStyle(fontSize: 20),
                ),
              ),
               ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: payLaterMode.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    // tileColor: Colors.amber,
                    contentPadding: const EdgeInsets.all(10),
                    onTap: () {},
                    leading: const CircleAvatar(
                      radius: 25,
                    ),
                    title:  Text(
                      paymentMode[index]['title']!,
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing:  Container(
                      // decoration: BoxDecoration(border: Border.all(width: 1)),
                      width: 75,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: Icon(paymentMode[index]['icon'],color: Colors.blue,),
                          ),
                          Text(
                            paymentMode[index]['trailing']!,
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
          
            ],
          ))
        ],
      ),
    ));
  }
}
