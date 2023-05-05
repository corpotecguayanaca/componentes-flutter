import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  const InputsPage({super.key});

  @override
  State<InputsPage> createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _nombre = "";
  String _email = "";
  String _fecha = "";
  String _opcionSeleccionada = 'Volar';

  List<String> _poderes = ['Volar', 'Rayos x', 'Super Aliento', 'Super Fuerza'];

  TextEditingController _inputFieldDateController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          const Divider(),
          _crearEmail(),
          const Divider(),
          _crearPassword(),
          const Divider(),
          _crearFecha(context),
          const Divider(),
          _crearDropdown(),
          const Divider(),
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
        suffixIcon: const Icon(Icons.accessibility_new),
        icon: const Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
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
        suffixIcon: const Icon(Icons.alternate_email),
        icon: const Icon(Icons.email),
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
        suffixIcon: const Icon(Icons.lock),
        icon: const Icon(Icons.key),
      ),
      onChanged: (valor) =>setState(() {})
      ,
    );
  }
  
  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration:  InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: "Fecha de nacimiento",
        labelText: 'Fecha de nacimiento',
        suffixIcon: const Icon(Icons.perm_contact_calendar),
        icon: const Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
      
    );
  }
  
  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2015), 
      lastDate: DateTime(2025),
      locale: const Locale('es', 'VE'),
    );

    if(picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha.split(' ')[0];
      });
    }
  }
  
  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];
    
    for (String poder in _poderes) {
      lista.add(DropdownMenuItem(
        value: poder,
        child: Text(poder),
      ));
    }

     return lista;
  }

  Widget _crearDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Selecciona un poder:"),
          DropdownButton(
            items: getOpcionesDropdown(),
            value: _opcionSeleccionada,
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt!;
                print(_opcionSeleccionada);
              });
            }
          ),
        ],
      ),
    );
  }

   Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre es $_nombre"),
      subtitle: Text("Email: $_email"),
      trailing: Text(_opcionSeleccionada),
    );
  }
}