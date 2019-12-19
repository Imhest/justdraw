import 'dart:ui';
import 'package:flutter/material.dart';

class Draw extends StatefulWidget {
  @override
  _DrawState createState() => _DrawState();
}

class _DrawState extends State<Draw> {
  // variables for selected color, picker color, stroke width, opacity, etc go here
  final _offsets = <Offset>[]; //this is a list that you can add to but you can't edit or reuse. You can add and remove items on the list tho

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JUSTDRAW'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onPanStart: (details) {
          print(details.globalPosition);
          _offsets.add(details.globalPosition);
        },
        onPanUpdate: (details) {
          print(details.globalPosition);
          _offsets.add(details.globalPosition);
        },
        onPanEnd: (details) {
          _offsets.add(null);
        },
        child: Center(
          child: CustomPaint(
            painter: JustDrawing(_offsets),
            child: Container(
              color: Colors.yellow[100]
            ),
          ),
        ),
      ),
    );
  }
}

class JustDrawing extends CustomPainter {
  final offsets;

  JustDrawing(this.offsets): super();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    for (var offset in offsets) {
      canvas.drawPoints(
        PointMode.points, 
        [offset], 
        paint
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}