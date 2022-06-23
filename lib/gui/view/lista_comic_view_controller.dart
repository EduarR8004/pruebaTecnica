import 'package:pruebatecnica/core/api.dart';
import 'package:pruebatecnica/data/modelos.dart';

class ComicController{
  ConexionApi conexion = ConexionApi();
  List <Result> _objetos=[];
  Future <List<Result>> listarComics()async{
    List map;
    map = await conexion.callMethod('https://comicvine.gamespot.com/api/issues/?api_key=f3049351e51401bb5b8ef3d89144be9c5b8e3ec4&format=json',[]);
    List<Result> objetos=[];
   for ( var entrada in map)
   {
     objetos.add(Result.fromJson(entrada));
   }
    return _objetos = objetos;

  }

  List <Result> obtenerComics() =>_objetos;
}