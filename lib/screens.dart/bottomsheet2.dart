import 'package:flutter/material.dart';

dynamic packageType(context) {
  return showModalBottomSheet(
      // elevation: 5,
      // backgroundColor: Colors.blue.shade100,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      )),
      isScrollControlled: true,
      constraints: BoxConstraints.tight(Size(MediaQuery.sizeOf(context).width,
          MediaQuery.sizeOf(context).height * 0.82)),
      context: context,
      builder: ((context) {
        return const Parcel();
      }));
}

class Parcel extends StatefulWidget {
  const Parcel({super.key});

  @override
  State<Parcel> createState() => _ParcelState();
}

class _ParcelState extends State<Parcel> {
  // bool value = false;
  List<String> selectedItems = [];

  List<String> items = const [
    "Food",
    "Medicine",
    "Groceries",
    "Documents",
    "Electronics",
    "Clothes",
    "Others"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.blue)),
          const SizedBox(
              // color: Colors.amber,
              height: 60,
              child: Center(
                  widthFactor: 1,
                  child: Text(
                    "Select Category",
                    style: TextStyle(fontSize: 27),
                  ))),
          const SizedBox(
              // color: Colors.amber,
              height: 40,
              child: Text(
                "Please select the items you want to send",
                style: TextStyle(fontSize: 17),
              )),
          Column(
              children: items
                  .map((item) => CheckboxMenuButton(
                      style: const ButtonStyle(
                          // iconSize: MaterialStatePropertyAll(20)
                          // padding: MaterialStatePropertyAll(EdgeInsets.only(right: 20))
                          ),
                      value: selectedItems.contains(item)? true:false,
                      onChanged: (bool ) {
                        
                        setState(() {
                          if(selectedItems.contains(item)){
                            selectedItems.remove(item);
                          }
                          else{
                            selectedItems.add(item);
                          }
                        });
                      },
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 20),
                      )))
                  .toList()),
          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        shadowColor: Colors.grey,
                        fixedSize: const Size(160, 60),
                        side: const BorderSide(width: 1)
                        ),
                    onPressed: () {Navigator.pop(context);},
                    child: const Text(
                      "Back",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.yellow.shade500,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        disabledBackgroundColor: Colors.yellow.shade300,
                        foregroundColor: Colors.black,
                        disabledForegroundColor: Colors.black54,
                        fixedSize: const Size(160, 60),
                        // side: BorderSide(width: 2)
                        ),
                    onPressed: () {},
                    child: const Text(
                      "Proceed",
                      style: TextStyle(fontSize: 20,),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
