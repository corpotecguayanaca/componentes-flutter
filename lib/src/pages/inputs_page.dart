import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  const InputsPage({super.key});

  @override
  State<InputsPage> createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _nombre = "";
  String _email = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }
  
  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.words,
      decoration:  InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text("Letras ${_nombre.length}"),
        hintText: "Nombre de la persona",
        labelText: 'Nombre',
        helperText: "Solo es el nombre",
        suffixIcon: Icon(Icons.accessibility_new),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }
  
  Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre es $_nombre"),
      subtitle: Text("Email: $_email"),
    );
  }
  
  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration:  InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: "example@email.com",
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (valor) =>setState(() => _email = valor)
      ,
    );
  }
  
  Widget _crearPassword() {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration:  InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: "Tu contraseña",
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock),
        icon: Icon(Icons.key),
      ),
      onChanged: (valor) =>setState(() {})
      ,
    );
  }
}