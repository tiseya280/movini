import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movini/Views/SubView.dart';
import 'package:movini/buttons/DropDownButton.dart';
import 'package:movini/pages/scheduel.dart';
import 'package:movini/screens/signin_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // nsi7a ki daber flous 5outh disque dur ssd w zido 8 go ram 5ater dev mobile y7eblo pc a9wa men haka.
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SignInScreen(),
    );
  }
}