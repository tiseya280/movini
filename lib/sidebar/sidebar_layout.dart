import 'package:flutter/material.dart';

import 'package:movini/sidebar/sidebar.dart';

import '../pages/home_page.dart';


class SideBarLayout extends StatelessWidget {
  const SideBarLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body : Stack(
            children:<Widget>[
              HomePage(),
              SideBar(),
            ]),
      );
  }
}
