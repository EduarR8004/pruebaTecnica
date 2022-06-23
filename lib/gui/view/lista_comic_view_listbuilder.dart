import 'package:flutter/material.dart';
import 'package:pruebatecnica/data/modelos.dart';
import 'package:intl/intl.dart';

import 'package:pruebatecnica/gui/view/lista_comic_view_controller.dart';
import 'package:pruebatecnica/gui/view/lista_comic_view_detalle.dart';

class ListaComic extends StatefulWidget {

  @override
  State<ListaComic> createState() => _ListaComicState();
}

class _ListaComicState extends State<ListaComic> {
  List<Result> resultados=[];
  final format = DateFormat("yyyy-MM-dd");
  ComicController controlador = ComicController();
  @override
    void initState() {
      listarResultados();
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:new AppBar(
        backgroundColor:Colors.black,
        title: Text('Lista',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:20,),)
      ),
      body:Container(
        //color: Colors.black,
        child: Center(child:body())
      ) ,
    );
  }
  
  Future <List<Result>> listarResultados()async{
    await controlador.listarComics().then((_){
      List<Result> preResultados=controlador.obtenerComics();
      for ( Result resultado in preResultados)
      {
        resultados.add(resultado);
      }        
    });
    return resultados;
  }

  Widget body(){
    return Column(
      children: [
        Expanded(
          child:Container(
            //color: Colors.black,
            width:360,
            child:listaComics()
          )   
        )
      ],
    );
  }

  FutureBuilder<List<Result>> listaComics() {
    return FutureBuilder<List<Result>>(
      future: listarResultados(),
      builder: (BuildContext context, AsyncSnapshot<List<Result>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index){
              Result item = snapshot.data[index];
              return cardCuenta(item);
            },
          );
        }else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget cardCuenta(Result item){
    return 
    Card(
      child:Container(
        height: 80,
        child: ListTile(
          title: Text(item.name,style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize:18,)),
          subtitle:Text(item.coverDate),
          leading: CircleAvatar(
            radius:40,
            child: ClipOval(child:Image.network(item.image.iconUrl),),
          ),
          onTap: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement( context, MaterialPageRoute( builder: (context) => Detalle(resultado: item,),)); });
          }
        ),
      )
    );
  }
}