import 'dart:math';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';
import 'dart:math' as math;

class Art extends CustomPainter {
  Art({
    Key? key,
    required this.ccontroller,
    required this.sizeAnimation,
  }) : super();

  final AnimationController ccontroller;
  late final Animation sizeAnimation;

//!Tringle
  // @override
  // void paint(Canvas canvas, Size size) {
  //   final paint = Paint()
  //     ..strokeWidth = 5
  //     ..color = Colors.indigoAccent
  //     ..style = PaintingStyle.stroke;
  //   final triangle = Path();
  //   triangle.moveTo(150, 20);
  //   triangle.relativeLineTo(100, 100);
  //   triangle.relativeLineTo(-150, 0);
  //   triangle.close();

  //   canvas.drawPath(triangle, paint);
  // }
//!square
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..strokeWidth = 5
//       ..color = Colors.indigoAccent
//       ..style = PaintingStyle.stroke;
//     final square = Path();
//     square.moveTo(150, 50);
//     square.relativeLineTo(100, 0);
//     square.relativeLineTo(0, 100);
//     square.relativeLineTo(-100, 0);

//     square.close();

//     canvas.drawPath(square, paint);
//     const square2 = Rect.fromLTWH(10, 100, 100, 100);
//     canvas.drawPath(square, paint);
//     canvas.drawRect(square2, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
//!Croos
  // @override
  // void paint(Canvas canvas, Size size) {
  //   final paint = Paint()
  //     ..strokeWidth = 5
  //     ..color = Colors.indigoAccent
  //     ..style = PaintingStyle.stroke;
  //   final cross = Path()
  //     ..moveTo(150, 500)
  //     ..relativeLineTo(50, 0)
  //     ..relativeLineTo(0, 50)
  //     ..relativeLineTo(-50, 0)
  //     ..relativeLineTo(0, 50)
  //     ..relativeLineTo(-50, 0)
  //     ..relativeLineTo(0, -50)
  //     ..relativeLineTo(-50, 0)
  //     ..relativeLineTo(0, -50)
  //     ..relativeLineTo(50, 0)
  //     ..relativeLineTo(0, -50)
  //     ..relativeLineTo(50, 0)
  //     ..relativeLineTo(0, 50)
  //     ..close();
  //   canvas.drawPath(cross, paint);
  // }
//!Circle
//  @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..strokeWidth = 4
//       ..color = Colors.blueAccent
//       ..style = PaintingStyle.stroke;
//     const circleRadius = 75.0;
//     const circleCenter = Offset(200, 150);
//     canvas.drawCircle(circleCenter, circleRadius, paint);
// //!type2 :circle
//     const ovalCenter = Offset(200, 275);
//     final oval = Rect.fromCenter(center: ovalCenter, width: 250, height: 100);
//     canvas.drawOval(oval, paint);
//   }
//!ArcDraw
  // @override
  // void paint(Canvas canvas, Size size) {
  //   var paint1 = Paint()
  //     ..color = Color(0xff63aa65)
  //     ..style = PaintingStyle.stroke
  //     ..strokeWidth = 5;
  //   //draw arc
  //   const arcCenter = Offset(200, 80);
  //   final arcRect = Rect.fromCircle(center: arcCenter, radius: 75);
  //   final startAngle = 0.0;
  //   final sweepAngle = 3.0;
  //   canvas.drawArc(arcRect, startAngle, sweepAngle, true, paint1);
  // }
//!CubicDraw
  // @override
  // void paint(Canvas canvas, Size size) {
  //   var paint1 = Paint()
  //     ..style = PaintingStyle.stroke
  //     ..color = Color(0xff63aa65)
  //     ..strokeWidth = 5;
  //   final qCurve1 = Path()
  //     ..moveTo(350, 50)
  //     // ..relativeQuadraticBezierTo(100, 10, 100, 100);
  //     ..relativeCubicTo(-200, 100, -100, 500, 0, 500);
  //   canvas.drawPath(qCurve1, paint1);
  // }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xffeceff1)
      ..style = PaintingStyle.fill;
    Paint painter = Paint()
      ..color = Color(0xFFA5D6A7)
      ..style = PaintingStyle.fill;
    final bdr = _borderRRect(size);
    canvas.drawRRect(bdr, paint);

    final pinRect = _pinRect(bdr);
    canvas.drawArc(pinRect, math.pi / 2, -math.pi, true, paint);
    ccontroller.forward();
    final chargeRRect = _chargeRRect(bdr);
    canvas.drawRRect(chargeRRect, painter);
  }

  final rect = Rect.fromLTWH(20, 20, 40 * 1, 20);

  RRect _borderRRect(Size size) {
    // 1
    final symmetricalMargin = 20 * 2;
    // 2
    final width = size.width - symmetricalMargin - 8 - 60;
    // 3
    final height = width / 2;
    // 4
    final top = (size.height / 2) - (height / 2);
    // 5
    final radius = Radius.circular(height * 0.2);
    // 6
    final bounds = Rect.fromLTWH(20, top, width, height);
    // 7
    return RRect.fromRectAndRadius(bounds, radius);
  }

  Rect _pinRect(RRect bdr) {
    // 1
    final center = Offset(bdr.right + 8, bdr.top + (bdr.height / 2.0));
    // 2
    final height = bdr.height * 0.38;
    // 3
    final width = 20.0 * 2;
    // 4

    return Rect.fromCenter(center: center, width: width, height: height);
  }

  RRect _chargeRRect(RRect bdr) {
    print(sizeAnimation.value.toString() + "art");
    final left = bdr.left + 8;
    final top = bdr.top + 8;
    final right = bdr.right - 8;
    final bottom = bdr.bottom - 8;
    final height = bottom - top;
    final width = right - left;
    final radius = Radius.circular(height * 0.15);

    final rect = Rect.fromLTWH(left, top, sizeAnimation.value, height);
    return RRect.fromRectAndRadius(rect, radius);
  }

  double charge() {
    double a = 0;
    for (var i = 1; i < 10; i++) {
      return a = .2 * i;
    }
    return a;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
