import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({Key? key}) : super(key: key);

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  var selectedDeparture;
  var selectedDestination;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Trips'),
            backgroundColor: Colors.blue[900],
          ),
       body: Container(
         child: Column(
           children: <Widget>[
               Center(child: Text("Thank you for choosing us dear client !")),
             Expanded(
               child:DropdownButton(
                 hint:Text("Select Your Place"),
                 items :["gabes","mednine","tunis","beja","mahdia","nabel","sfax","gafsa"].map((e) => DropdownMenuItem(
                   child: Text("$e"),
                   value: e,)).toList(),
                 onChanged:(val){
                   setState(() {
                     selectedDestination = val ;
                   });
                 },
                 value : selectedDestination,
               ),
             ),
             ],
         ),
       ),
    );
  }
}
