import 'package:flutter/material.dart';

class Health extends StatefulWidget {
  const Health({Key? key}) : super(key: key);

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Text("health"),
    ));
  }
}
