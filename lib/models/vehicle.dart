import 'package:cloud_firestore/cloud_firestore.dart';
class Vehicle {
  String vehicleID;
  String name;
  String type;
  String Driver;

  Vehicle(
      {required this.vehicleID, required this.name, required this.type, required this.Driver});

  Map<String, dynamic> toJson() => {
    "name": name,
    "Driver": Driver,
    "type": type,
    "vehicleID": vehicleID,
  };

  static Vehicle fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Vehicle(
      type: snapshot['type'],
      Driver: snapshot['Driver'],
      vehicleID: snapshot['vehicleID'],
      name: snapshot['name'],
    );
  }
}