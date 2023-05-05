import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 50.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            _crearSlider(),
            Expanded(
              child: _crearImagen(),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _crearSlider() {
    return Slider(
      min: 50.0,
      max: 350.0,
      onChanged: (valor) {
        setState(() {
           _sliderValue = valor;
        });
      },
      value: _sliderValue,
      activeColor: Colors.indigoAccent,
      label: "Tamaño de la imagen",
    );

  }
  
  Widget _crearImagen() {
    return Image(
      image: NetworkImage("https://assets.stickpng.com/images/5ba0d5b144d37f02b751791e.png"),
      width: _sliderValue,
      fit: BoxFit.contain,
      ); 
  }
}