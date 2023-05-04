import 'package:flutter/material.dart';

import 'package:componentes_flutter/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
      ),
      body: _lista(),
    );
  }
  
  Widget _lista() {
    
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder:(context, snapshot) {
        return ListView(
          children: _listaItems( snapshot.data! ),
        );
      },
    );
  }
  
  List<Widget> _listaItems( List<dynamic> data ) {
    final List<Widget> opciones = [];
      
    for (dynamic element in data) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: Icon(Icons.car_crash, color: Colors.indigo,),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.indigo,),
      );
      opciones..add(widgetTemp)
        ..add(Divider());
    }

    return opciones;

  }
}