import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movini/screens/reusable_widget.dart';
import 'package:movini/screens/home_screen.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage("img/back.png"),
              fit: BoxFit.cover
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 400,),
            reusableTextField("Enter UserName", Icons.person_outline, false,
                _userTextController),
            SizedBox(height: 30,),
            reusableTextField("Enter Email Adress", Icons.person_outline, false,
                _emailTextController),
            SizedBox(height: 30,),
            reusableTextField("Enter Password", Icons.lock_outline, false,
                _passwordTextController),
            SizedBox(height: 20,),
            signInsignUpButton(context, false, () {
              FirebaseAuth.instance.createUserWithEmailAndPassword(
                  password: _passwordTextController.text ,
                  email: _emailTextController.text).then((value){
                    print("created new account");
                       Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
              }).onError((error, stackTrace){
                print("error ${error.toString()}");
              });

            }),
          ],
        ),
      ),
    );
  }
}
