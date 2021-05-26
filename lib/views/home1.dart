import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation positionAnimation;
  Animation latePositionAnimation;
  Animation colorAnimation;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 5));

    positionAnimation = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    )..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        controller.reset();
        positionAnimation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.fastOutSlowIn
          ),
        );

      }
    });

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}