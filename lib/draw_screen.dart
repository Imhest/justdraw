import 'dart:ui';
import 'package:flutter/material.dart';

class Draw extends StatefulWidget {
  @override
  _DrawState createState() => _DrawState();
}

class _DrawState extends State<Draw> {
  // variables for selected color, picker color, stroke width, opacity, etc go here
  List<Offset> points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Just Draw'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onPanStart: (details) {
          setState (() {  
            RenderBox box = context.findRenderObject();
            Offset point = box.globalToLocal(details.globalPosition);
            point = point.translate(0.0, - (AppBar().preferredSize.height));

            points = List.from(points)..add(point);
          });
        },
        onPanUpdate: (details) {
          setState (() {  
            RenderBox box = context.findRenderObject();
            Offset point = box.globalToLocal(details.globalPosition);
            point = point.translate(0.0, - (AppBar().preferredSize.height));

            points = List.from(points)..add(point);
          });
        },
        onPanEnd: (details) {
          setState (() {
            points.add(null);
          });
        },
        child: CustomPaint(
          painter: JustDrawing(points),
          child: Container(
            color: Colors.transparent,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'clear screen',
        backgroundColor: Colors.amber[800],
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() => points.clear());
        },
      ),
    );
  }
}

class JustDrawing extends CustomPainter {
  final List<Offset> points;

  JustDrawing(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..strokeWidth = 4.0;

    for (var i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}