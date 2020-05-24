import 'package:flutter/material.dart';
import 'package:frozen/HomeScreen.dart';
import 'dart:math';
import 'package:frozen/animation.dart';
import 'package:frozen/howtouse.dart';
class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green;
    paint.style = PaintingStyle.fill;

    var path = Path();

    var paints = Paint();

    paints.color = Colors.green[200];
    paints.style = PaintingStyle.fill;
  //  var ac=Path();
    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.2,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height *0.3,
        size.width * 1.0, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
class welcome extends StatefulWidget {

  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  Offset _offset = Offset(0, 0);
  @override
  Widget build(BuildContext context) {

    return  SafeArea(

        child: Container(
          margin: EdgeInsets.all(1),
          color: Colors.white,
          child: CustomPaint(

            painter: CurvePainter(),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10,top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Transform.rotate(
                          angle:pi/10,
                          child: Container(
                              child: Icon(Icons.dehaze,color: Colors.white,size: 27,)))
                    ],
                  ),
                ),

                Container(child: Text('WELCOME',
                  style: TextStyle(fontFamily: 'BalsamiqSans',color: Colors.white,fontWeight: FontWeight.w900,fontSize: 24,decoration: TextDecoration.none),

                ),),

                Container(child: Text('TO',
                  style: TextStyle(fontFamily: 'BalsamiqSans',color: Colors.white,fontWeight: FontWeight.w900,fontSize: 24,decoration: TextDecoration.none),

                ),),
                Container(child: Text('FROZEN',
                  style: TextStyle(fontFamily: 'BalsamiqSans',color: Colors.white,fontWeight: FontWeight.w900,fontSize: 24,decoration: TextDecoration.none),

                ),),
                SizedBox(height: 150,),
                FlatButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        animation(widget: HomeScreen())
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green,
                          width: 4,

                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(15)
                        )
                    ),
                    child: Text('CREATE NEW',style: TextStyle(fontFamily: 'BalsamiqSans',color: Colors.green,fontWeight: FontWeight.w900,fontSize: 24,decoration: TextDecoration.none),),
                  ),
                ),
                SizedBox(height: 40,),
                FlatButton(
                  onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder:(_)=> HomeScreen()
                        )
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green,
                          width: 4,

                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(15)
                        )
                    ),
                    child: Text('YOUR PROJECT',style: TextStyle(fontFamily: 'BalsamiqSans',color: Colors.green,fontWeight: FontWeight.w900,fontSize: 24,decoration: TextDecoration.none),),
                  ),
                ),
                SizedBox(height: 40,),
                FlatButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        animation(widget: use())
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green,
                          width: 4,

                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(15)
                        )
                    ),
                    child: Text('HOW TO USE',style: TextStyle(fontFamily: 'BalsamiqSans',color: Colors.green,fontWeight: FontWeight.w900,fontSize: 24,decoration: TextDecoration.none),),
                  ),
                ),
              ],
            ),

          ),
        )

    );

  }


}
/*
Transform(  // Transform widget
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001) // perspective
          ..rotateX(0.01 * _offset.dy) // changed
          ..rotateY(-0.01 * _offset.dx), // changed
        alignment: FractionalOffset.center,
        child: GestureDetector( // new
          onPanUpdate: (details) => setState(() => _offset += details.delta),
          onDoubleTap: () => setState(() => _offset = Offset.zero),
          child: _playing(context),
        )
    )
 */