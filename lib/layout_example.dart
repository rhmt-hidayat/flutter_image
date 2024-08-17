import 'package:flutter/material.dart';

class LayoutExample extends StatefulWidget {
  const LayoutExample({super.key});

  @override
  State<LayoutExample> createState() => _LayoutExampleState();
}

class _LayoutExampleState extends State<LayoutExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ListView.builder(
      body: ListView.separated(
        //jika ingin dibagi"
        itemBuilder: (context, index) {
          return Container(
            height: 40,
            color: Colors.blue,
          );
        },
        itemCount: 20,
        separatorBuilder: (context, index) {
          return const Divider(); //atau sizedBox dibawah hasil sama aja
          // return const SizedBox(
          //   height: 10,
          // );
        },
      ),
    );
  }
}
