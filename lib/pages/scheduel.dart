import 'package:flutter/material.dart';


import '../Views/tripsView.dart';




class Scheduel extends StatefulWidget {
  const Scheduel({Key? key}) : super(key: key);

  @override
  State<Scheduel> createState() => _ScheduelState();
}

class _ScheduelState extends State<Scheduel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Stack(
          children:<Widget>[
            TripsView(),
          ]),
    );
  }
}
