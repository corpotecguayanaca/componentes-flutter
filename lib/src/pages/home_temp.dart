import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  HomePageTemp({super.key});

  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes Temp"),
      ),
      body: ListView(
        children: _crearItemsCorta(),
      ),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = [];
    
    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      lista..add(tempWidget)
          ..add(Divider());
    }

    return lista;
  }

  List<Widget> _crearItemsCorta() {
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text("$item!"),
            leading: Icon(Icons.donut_large),
            trailing: Icon(Icons.grading),
            onTap: (){},
          ),
          const Divider(),
        ],
      );
    }).toList();
  }
}