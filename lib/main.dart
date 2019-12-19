import 'package:flutter/material.dart';
import 'draw_screen.dart';

void main() => runApp(JustDraw());

class JustDraw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.amber[400]),
      debugShowCheckedModeBanner: false,
      home: Draw(),
    );
  }
}