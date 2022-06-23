
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:pruebatecnica/data/modelos.dart';

class ConexionApi extends ChangeNotifier{
  Welcome status = Welcome();
  callMethod( String webservice,params)async {
    var url = Uri.parse(webservice);
    Response response;
    try{
        response = await http.get(url, headers: {
       "format": "json",
        "api_key":'f3049351e51401bb5b8ef3d89144be9c5b8e3ec4',
      });
      Map data;
      data = jsonDecode(response.body);
      List<Map> lis = new List<Map>.from( data["results"]);
      return lis;

    }catch(e){
      return e;
    }
  }

}