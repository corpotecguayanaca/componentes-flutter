import 'package:componentes_flutter/src/pages/alert_page.dart';
import 'package:flutter/material.dart';

import 'package:componentes_flutter/src/providers/menu_provider.dart';
import 'package:componentes_flutter/src/utils/icon_string_util.dart';

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
          children: _listaItems( snapshot.data!, context),
        );
      },
    );
  }
  
  List<Widget> _listaItems( List<dynamic> data, BuildContext context ) {
    final List<Widget> opciones = [];
      
    for (dynamic element in data) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.indigo,),
        onTap: () {
          Navigator.pushNamed(context, element['ruta']);
        },
      );
      opciones..add(widgetTemp)
        ..add(Divider());
    }

    return opciones;

  }
}