import 'package:flutter/cupertino.dart';

class WaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
   debugPrint(size.width.toString());
   // ignore: non_constant_identifier_names
   var path=new Path();
   path.lineTo(0, size.height);
   var firstStart=Offset(size.width/5,size.height );
   //First point of quadratic bezier curve
   var firstEnd=Offset(size.width/2.25,size.height- 50);
    //Second point of quadratic bezier curve
   path.quadraticBezierTo(firstStart.dx, firstStart.dy,firstEnd.dx, firstEnd.dy);
   var secondStart=Offset(size.width-(size.width/3.24), size.height-105);
    //Third point of quadratic bezier curve
   var secondEnd=Offset(size.width, size.height-10);
    //Fourth point of quadratic bezier curve
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {

    return true;
  }

}