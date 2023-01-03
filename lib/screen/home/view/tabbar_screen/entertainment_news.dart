import 'package:flutter/material.dart';

class Entertainment extends StatefulWidget {
  const Entertainment({Key? key}) : super(key: key);

  @override
  State<Entertainment> createState() => _EntertainmentState();
}

class _EntertainmentState extends State<Entertainment> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Text("entertainment"),
    ));
  }
}
