import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 150.0;
  bool _blockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
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
      onChanged: (_blockCheck) ? null: (valor) {
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
    return FadeInImage(
      placeholder: const AssetImage('assets/jar-loading.gif'),
      image: const NetworkImage('https://assets.stickpng.com/images/5ba0d5b144d37f02b751791e.png'),
      fadeInDuration: const Duration(milliseconds: 500),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckBox() {
    return CheckboxListTile(
      title: const Text("Bloquear slider con CheckBox"),
      value: _blockCheck,
      onChanged: (value) {
        setState(() {
          _blockCheck = value!;
        });
      },
    );
  }

  _crearSwitch() {
    return SwitchListTile(
      title: const Text("Bloquear slider con switch"),
      value: _blockCheck,
      onChanged: (value) {
        setState(() {
          _blockCheck = value;
        });
      },
    );
  }
}
