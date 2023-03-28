import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movini/pages/complains.dart';
import 'package:movini/pages/home_page.dart';
import 'package:movini/pages/scheduel.dart';
import 'package:movini/pages/subsucription.dart';
import 'package:movini/sidebar/menu_item.dart';
import 'package:rxdart/rxdart.dart';
import '../pages/notifications.dart';
import '../pages/reservations.dart';
class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar>{
   late AnimationController _animationController;
   late StreamController<bool> isSideOpenedStreamController ;
   late Stream<bool> isSideOpenedStream ;
   late StreamSink<bool> isSideOpenedSink ;
  final _animationDuration = const Duration(milliseconds: 500);
  //final bool isSideBarOpened = false ;

  @override
  void initState() {
    super.initState();
    _animationController=AnimationController(vsync: this , duration: _animationDuration);
    isSideOpenedStreamController = PublishSubject<bool>();
    isSideOpenedStream = isSideOpenedStreamController.stream;
    isSideOpenedSink = isSideOpenedStreamController.sink;
  }
  @override
  void dispose() {
    _animationController.dispose();
    isSideOpenedStreamController.close();
    isSideOpenedSink.close();
    super.dispose();
  }

  void onIconPressed(){
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted){
      isSideOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSideOpenedSink.add(true);
      _animationController.forward();
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSideOpenedStream,
      builder: (context,isSideBarOpenedAsync){
        return AnimatedPositioned(
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data! ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data! ? 0 : screenWidth - 45 ,
          duration: _animationDuration,
          child: Row(
            children: <Widget>[
              Expanded(child: Container(
                color: Colors.blue[900],
                child: Column(
                  children :<Widget>[
                    SizedBox(
                      height: 100,),
                    ListTile(
                      title: Text("aya.tiss",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w800),),
                    subtitle: Text("aya.tiss@gmail.com",style: TextStyle(color: Colors.white,fontSize: 20),),
                     leading: CircleAvatar(
                       child: Icon(
                         Icons.perm_identity,
                         color: Colors.white,
                       ),
                       radius: 40,
                     ), ),
                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color: Colors.white,
                      indent: 32,
                      endIndent: 32,
                    ),
                    MenuItem(
                        icon: Icons.home,
                        title: "Profile",
                        onTap:(){
                          onIconPressed();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>HomePage()));

                        }
                    ),
                    MenuItem(
                        icon: Icons.directions_car,
                        title: "Trips",
                        onTap:(){
                          onIconPressed();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>Scheduel()));
                        }
                    ),
                    MenuItem(
                        icon: Icons.car_crash_outlined,
                        title: "Notifications",
                        onTap:(){
                          onIconPressed();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>Notifications()));

                        }
                    ),
                    MenuItem(
                        icon: Icons.calendar_month,
                        title: "Reservations",
                      onTap:(){
                        onIconPressed();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>Reservation()));

                      }
                    ),
                    MenuItem(
                        icon: Icons.chat_outlined,
                        title: "Complain",
                        onTap:(){
                          onIconPressed();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>Complain()));

                        }
                    ),
                    MenuItem(
                        icon: Icons.card_membership,
                        title: "Subsucription",
                        onTap:(){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>Subsucription()));

                        }
                    ),
                  ],
                ),
              ),
              ),
              Align(
                alignment: Alignment(0,-0.9),
                child: GestureDetector(
                  onTap: (){
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Colors.blue[900],
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],

          ),
        );
      },

    );
  }

}
class CustomMenuClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    Paint paint = Paint();
    paint.color=Colors.white;

    final width= size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width-1, height/2-20, width, height/2);
    path.quadraticBezierTo(width+1, height/2+20, 10, height-16);
    path.quadraticBezierTo(0, height-8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}


