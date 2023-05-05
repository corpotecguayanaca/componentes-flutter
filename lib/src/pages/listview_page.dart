import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  
  ScrollController _scrollController = ScrollController();

  List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  bool _isLoading = false;
  
  @override
  void initState() {
    super.initState();
    _addTen();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent)
        _fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading()
        ],
      )
      
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _paginaUno,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (context, index) {
          final imagen = _listaNumeros[index];
          print(index);
          return _imageCard(imagen);
        },
      ),
    );
  }

  void _addTen() {
    for (int i=0; i<10; i++){
      if(_ultimoItem == 86 || _ultimoItem == 97) _ultimoItem++;
      _listaNumeros.add(_ultimoItem++);
    }

    setState(() {});
  }
  
  Future<Timer> _fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = Duration(seconds: 2);
    return Timer(duration, _respuestaHTTP);
  }

  void _respuestaHTTP() {
    _isLoading = false;
    _addTen();
    _scrollController.animateTo(
      _scrollController.position.pixels + 100.0, 
      duration: const Duration(milliseconds: 500), 
      curve: Curves.fastOutSlowIn,
    );
  }
  
  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 15.0,),
        ],
      );
    } else {
      return Container();
    }
  }
  
  Future<void> _paginaUno() async {
    final duration = Duration(seconds: 2);
    Timer(duration, () { 
      _listaNumeros.clear();
      _ultimoItem++;
      _addTen();
     });
    return Future.delayed(duration);
  }
  
  Widget _imageCard(int imagen) {
    
    final image = FadeInImage(
        placeholder: const AssetImage('assets/jar-loading.gif'),
        image: NetworkImage("https://picsum.photos/700/500/?image=$imagen"),
        height: 300.0,
        fit: BoxFit.cover,
      );

    final  card = Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: const[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: image,
      ),
    );

    return Column(
      children: [
        card,
        const SizedBox(height: 15.0,),
      ],
    );    
  }
}