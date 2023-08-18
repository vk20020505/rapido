import 'package:flutter/material.dart';

dynamic favoriteLocation(context) {
  return showModalBottomSheet(
      // elevation: 5,
      // backgroundColor: Colors.blue.shade100,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      )),
      // isScrollControlled: true,
      constraints: BoxConstraints.tight(Size(MediaQuery.sizeOf(context).width,
          MediaQuery.sizeOf(context).height * 0.38)),
      context: context,
      builder: ((context) {
        return const Favorite();
      }));
}

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Choose title",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 15,
                          child: Icon(
                            Icons.home,
                            color: Colors.white,
                          )),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Home",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Add Home Address",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    )
                  ],
                ),
                InkWell(
                    onTap: () {},
                    child: const Text(
                      "Add",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 15,
                          child: Icon(
                            Icons.work,
                            color: Colors.white,
                          )),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Work",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Add Work Address",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    )
                  ],
                ),
                InkWell(
                    onTap: () {},
                    child: const Text(
                      "Add",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 15,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                          )),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Other",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Add customized favorite name ",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    )
                  ],
                ),
                InkWell(
                    onTap: () {},
                    child: const Text(
                      "Add",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
