import 'package:flutter/material.dart';

class SearchPlace extends StatelessWidget {
 const SearchPlace({super.key, required this.click});
  final bool click;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          title: TextFormField(
            keyboardType: TextInputType.streetAddress,
              cursorColor: Colors.grey.shade600,
              decoration: InputDecoration(
                  hintText: (click == true)
                      ? 'Search pickup location'
                      : 'Search drop location',
                  hintStyle: Theme.of(context).textTheme.bodySmall)),
        ),
      ),
    );
  }
}
