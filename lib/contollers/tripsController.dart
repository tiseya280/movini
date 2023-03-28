import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movini/models/trips.dart';
import 'package:get/get.dart';
import 'package:movini/constants.dart';

class TripsController {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Trips>> getTrips() {
    return _firestore
        .collection('trips')
        .snapshots()
        .map((snapshot) =>
        snapshot.docs
            .map((doc) =>
            Trips(
              id: doc.id,
              departure: doc.data()['departure'],
              destination: doc.data()['destination'],
              vehicleID: doc.data()['vehicleID'],
            ))
            .toList());
  }
}



