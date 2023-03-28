import 'package:cloud_firestore/cloud_firestore.dart';

class User {
   String name;
   String surname;
   String username;
   String Photo;
   String email;
   String uid;
   String adress ;


   User(
       {required this.name,
          required this.email,
          required this.uid,
          required this.Photo,
          required this.adress,
       required this.surname,
       required this.username});

   Map<String, dynamic> toJson() => {
      "name": name,
      "Photo": Photo,
      "email": email,
      "uid": uid,
      "username": username,
      "surname": surname,
      "adress": adress,
   };

   static User fromSnap(DocumentSnapshot snap) {
      var snapshot = snap.data() as Map<String, dynamic>;
      return User(
         email: snapshot['email'],
         Photo: snapshot['Photo'],
         uid: snapshot['uid'],
         name: snapshot['name'],
         username: snapshot['username'],
         surname: snapshot['surname'],
         adress: snapshot['adress'],
      );
   }
}