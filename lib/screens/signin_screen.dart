import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movini/screens/reusable_widget.dart';
import 'package:movini/screens/signup_screen.dart';
import 'package:movini/contollers/authController.dart';


class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key }) : super(key: key);
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  AuthController authController = AuthController();


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
                _emailTextController),
            SizedBox(height: 30,),
            reusableTextField("Enter Password", Icons.lock_outline, false,
                _passwordTextController),
            SizedBox(height: 20,),
            Container(
              width:MediaQuery.of(context).size.width*0.4,
              height: 50,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
              child: ElevatedButton(
                onPressed: (){
                  onTap: () =>
                      authController.loginUser(
                        _emailTextController.text,
                        _passwordTextController.text,
                      );},
                child: Text('LOG IN', style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states){
                  if(states.contains(MaterialState.pressed)){
                    return Colors.indigoAccent[100];
                  }
                  return Colors.blue[900];
                }),shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 20, color: Colors.blue[900]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),



    );
  }
}

