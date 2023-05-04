import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.indigo;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 800,),
          curve: Curves.bounceIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _cambiarForma,
        child: Icon(Icons.switch_access_shortcut),
      ),
    );
  }

  void _cambiarForma() {
    setState(() {
      _width = Random().nextDouble() * 300.0;
      _height = Random().nextDouble() * 300.0;
      _borderRadius = BorderRadius.circular(Random().nextDouble() * 100.0);
      _color = Color.fromRGBO(
        Random().nextInt(255), 
        Random().nextInt(255), 
        Random().nextInt(255), 
        1
        );
    });
  }
}
