import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: const CircleAvatar(
              backgroundImage: NetworkImage("https://cdn.dribbble.com/users/323571/screenshots/5412611/batman_4x.jpg"),
              radius: 25.0,
            ),
          ),
          
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('LM'),
              backgroundColor: Colors.green[200],
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage("https://preview.redd.it/v0gmtto9p4591.jpg?auto=webp&s=d7c435c3240c4eb3605f44f6e1f9e039695e35f6"),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}