import 'package:flutter/material.dart';
class MenuItem extends StatelessWidget {
  const MenuItem({Key? key, required this.icon, required this.title, required this.onTap}) : super(key: key);

        final IconData icon ;
        final String title ;
        final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(padding: const EdgeInsets.all(16),
      child: Row(
        children:<Widget> [
          Icon(icon,
              color: Colors.white,
              size: 30,),
          SizedBox(width: 20,),
          Text(title,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 26,color: Colors.white),)
        ],
      ),),
    );
  }
}
