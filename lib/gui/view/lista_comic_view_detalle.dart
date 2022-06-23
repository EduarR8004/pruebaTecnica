import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:pruebatecnica/data/modelos.dart';
import 'package:pruebatecnica/gui/view/lista_comic_view_listbuilder.dart';

class Detalle extends StatelessWidget {
  final Result resultado;
  Detalle({ this.resultado });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:new AppBar(
        backgroundColor:Colors.black,
        title: Text('Detalle',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:20,),)
      ),
      body:new SingleChildScrollView(
        child:Container(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(resultado.name,style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:30,),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.black,width: 200,height:200, 
                  child:Image.network(resultado.image.iconUrl,fit:BoxFit.cover,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 10, 2),
                child: Text(resultado.coverDate,style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:20,)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 2, 10, 2),
                child: Html( data:resultado.description),
              ) 
            ],
          )
        ),
      ) ,
      floatingActionButton: FloatingActionButton(
        backgroundColor:Colors.black,
        onPressed: () {
          WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement( context, MaterialPageRoute( builder: (context) => ListaComic(),)); });
        },
        child:const Icon(Icons.arrow_forward),
        //backgroundColor: Color.fromRGBO(56, 124, 43, 1.0),
      ),
    );
  }
  
}