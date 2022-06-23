import 'package:flutter/material.dart';
import 'package:pruebatecnica/gui/view/lista_comic_view_listbuilder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Comics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListaComic(),
    );
  }
}

