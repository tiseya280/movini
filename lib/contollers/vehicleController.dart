import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movini/models/vehicle.dart';
import 'package:get/get.dart';
import 'package:movini/constants.dart';

class VehicleController extends GetxController{
  static Future<Map<String,dynamic>?>getVehicleById(String vehicleID)async{
    DocumentSnapshot snapshot =
        await firestore.collection('vehicle').doc(vehicleID).get();
    if (snapshot.exists){
      return snapshot.data() as Map<String,dynamic>;
    }
    else {
      return
        null;
    }
  }


}