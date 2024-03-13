import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Contador(),
    );
  }
}

class Contador extends StatefulWidget {
  State<Contador> createState() => ContadorPagina();
}

class ContadorPagina extends State<Contador> {
  var contagem = 0;

  void aumentaContagem() {
    setState(() {
      contagem++;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Image.network(
                'https://i.kym-cdn.com/photos/images/newsfeed/002/297/368/17f.jpg',
                height: 150,
              ),
              onVerticalDragEnd: (DragEndDetails details) {
                aumentaContagem();
              },
            ),
            Text('Voce apertou o botao essa quantidade de vezes'),
            Text('$contagem'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: aumentaContagem,
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
            child: Text('Gaveta'),
          ),
          ListTile(
            title: Text('Aperte'),
            onTap: aumentaContagem,
          ),
          ListTile(
            title: Text('Aperte e Segure'),
            onLongPress: aumentaContagem,
          ),
        ],
      )),
    );
  }
}
