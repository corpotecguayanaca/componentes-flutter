import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),

        ],
      ),
    );
  }
  
  Widget _cardTipo1() {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.indigo,),
            title: Text("Titulo de la tarjeta"),
            subtitle: Text("Este es el subtitulo de la tarjeta. Aqui deberia ir una descripcion de lo que sea que queramos poner en la tarjeta, puede ser cualquier cosa"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(onPressed:() {} , child: Text("Cancelar")),
              SizedBox(width: 10,),
              ElevatedButton(onPressed:() {} , child: Text("Ok")),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _cardTipo2() {
    return Card(
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://iso.500px.com/wp-content/uploads/2014/07/big-one.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("data"),
          ),
        ],
      ),
    );
  }
}