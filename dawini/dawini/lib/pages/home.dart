import 'package:flutter/material.dart';

// ignore: camel_case_types
class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}
 
class _homeScreenState extends State<homeScreen> {
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column (
        children: [
          ElevatedButton(onPressed: onPressed, child: Text("create")),
          ElevatedButton(onPressed: onPressed, child: Text("delete"))
        ]
      ),

    );
  }
}