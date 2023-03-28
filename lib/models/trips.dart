import 'package:cloud_firestore/cloud_firestore.dart';

class Trips {
  String id;
  String departure;
  String destination;
  String vehicleID;

  Trips({required this.id, required this.departure, required this.destination, required this.vehicleID});


  Map<String, dynamic> toJson() => {
    'departure': departure,
    'destination': destination,
    'vehicleID': vehicleID,
    'id': id,
  };

  static Trips fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Trips(
      departure: snapshot['departure'],
      destination: snapshot['destination'],
      vehicleID: snapshot['vehicleID'],
      id: snapshot['id'],
    );
  }
}
