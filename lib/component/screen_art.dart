import 'package:flutter/material.dart';
import 'package:paint/component/art.dart';

class Screen_Art extends StatefulWidget {
  @override
  _Screen_ArtState createState() => _Screen_ArtState();
}

class _Screen_ArtState extends State<Screen_Art> with TickerProviderStateMixin {
  int currentPage = 0;
  int _selectedIndex = 0;
  double wid = 6;
  Offset _offset = Offset.zero;

  late AnimationController ccontroller;
  late Animation sizeAnimation;

  void initState() {
    super.initState();

    ccontroller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    sizeAnimation = Tween<double>(begin: 60, end: 300).animate(ccontroller);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      ccontroller =
          AnimationController(vsync: this, duration: Duration(seconds: 5));

      //   ccontroller.forward(from: 0.5);
      sizeAnimation = TweenSequence<double>(
        <TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 0, end: 270.0),
            weight: .1,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 270, end: 0.0),
            weight: .1,
          ),
        ],
      ).animate(ccontroller);
      print(sizeAnimation.value.toString() + "1234");
    });
    return Scaffold(
        body: AnimatedBuilder(
            animation: ccontroller,
            builder: (context, Widget? child) {
              print(sizeAnimation.value.toString() + "14");
              return CustomPaint(
                willChange: true,
                painter:
                    Art(ccontroller: ccontroller, sizeAnimation: sizeAnimation),
                child: Container(),
              );
            }));
  }
}
