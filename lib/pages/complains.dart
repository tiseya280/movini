import 'package:flutter/material.dart';


class Complain extends StatefulWidget {
  const Complain({Key? key}) : super(key: key);

  @override
  State<Complain> createState() => _ComplainState();
}

class _ComplainState extends State<Complain> {
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Text("Complain yall !!! ")
    );
  }
}
