import 'package:flutter/material.dart';
import 'package:movini/contollers/tripsController.dart';
import 'package:movini/models/trips.dart';
import 'package:get/get.dart';
import'package:movini/constants.dart';
import '../contollers/vehicleController.dart';



class TripsView extends StatefulWidget {
  const TripsView({Key? key}) : super(key: key);

  @override
  State<TripsView> createState() => _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
  TripsController _controller = TripsController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trips'),
      ),
      body:
          StreamBuilder<List<Trips>>(
            stream: _controller.getTrips(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Trips>? trips = snapshot.data;
                return ListView.builder(
                  itemCount: trips?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Row(children: [
                        Text(trips![index].departure,
                          style: const TextStyle(
                            fontSize: 19,
                            color: Colors.red,
                            fontWeight: FontWeight.w700,
                          ),),
                        SizedBox(width: 13,),
                        Text(trips![index].destination,
                          style: const TextStyle(
                            fontSize: 19,
                            color: Colors.blue,
                            fontWeight: FontWeight.w700,
                          ),)]),
                      subtitle:FutureBuilder(
                        future: VehicleController.getVehicleById(trips![index].vehicleID),
                        builder: (BuildContext context, AsyncSnapshot<Map<String,dynamic>?>snapshot){
                          if (snapshot.connectionState==ConnectionState.done){
                            if(snapshot.hasError || snapshot.data==null){
                              return Text("Error !");
                            }else {
                              Map<String,dynamic> data=snapshot.data!;
                              return Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                    children: [Text(data['type'],
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),

                                    ),
                                      Text(data['name'],
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),

                                      ),

                                    ]),
                              );
                            }
                          }else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
    );
  }
}
















































