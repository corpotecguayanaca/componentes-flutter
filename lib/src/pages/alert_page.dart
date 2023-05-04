import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _mostrarAlerta(context), 
          child: Text("Mostrar Alerta"),
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
  
  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context, 
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text("Alerta"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Contenido de la alerta en una columna"),
              FlutterLogo(size: 100,)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: Text("Ok"),
            ),
          ],
        );
      }
    );
  }
}