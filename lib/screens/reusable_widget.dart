import 'package:flutter/material.dart';


TextField reusableTextField(String text , IconData icon , bool isPasswordType, TextEditingController controller){
  return TextField(controller: controller ,
  obscureText: isPasswordType,
  enableSuggestions: !isPasswordType,
  autocorrect: !isPasswordType,
  cursorColor: Colors.indigo[200],
  style: TextStyle(color: Colors.blue[900]),
    decoration: InputDecoration(
        prefixIcon: Icon(icon , color:Colors.indigo[200] ,),
        labelText : text ,
        labelStyle: TextStyle(color: Colors.indigo[200] ),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor:Colors.indigo[50],
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style:BorderStyle.none ))
    ),
    keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}

Container signInsignUpButton(BuildContext context, bool isLogin, Function onTap){
  return Container(width: MediaQuery.of(context).size.width*0.4,
  height: 50,
  margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
  child: ElevatedButton(
    onPressed: (){
    onTap();},
    child: Text(isLogin ? 'LOG IN' : 'SIGN UP', style: const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
    ),
    style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states){
      if(states.contains(MaterialState.pressed)){
        return Colors.indigoAccent[100];
      }
      return Colors.blue[900];
    }),shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
  ),);
}