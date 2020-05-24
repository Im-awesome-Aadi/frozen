import 'package:flutter/cupertino.dart';

class animation extends PageRouteBuilder{
  final Widget widget;
  animation({this.widget}):super(

          transitionDuration:  Duration(milliseconds: 770),
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation,Widget child){
            //animation=CurvedAnimation(parent: animation,curve: Curves.elasticInOut);
            var begin = Offset(1.0, 0.0);
            var end = Offset.zero;
            var curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              //scale: animation,
              position: animation.drive(tween),
              child: child,
              //alignment: Alignment.center,
            );
          },
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation){
            return widget;
          }

  );



}