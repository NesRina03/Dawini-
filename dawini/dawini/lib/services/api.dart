import 'dart:convert';

import 'package:dawini/pages/config.dart';
import 'package:dawini/model/login_req.dart';
import 'package:dawini/model/login_res.dart';
import 'package:dawini/services/shared_serices.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl="192.168.1.33:2000";
  static var client = http.Client();

  static Future<bool> login( LoginRequest model) async { 
   Map<String,String> requestHeaders ={
    'Content-type':'application/json'
   };
    var url = Uri.http(config.apiUrl,config.loginapi);
    
    var response = await client.post(url,
    headers: requestHeaders,
    body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200 ){
      await shared_service.SetLoginDetails(loginResponseFromJson(response.body));
      return true ;
    } else { return false ;}

    
  }
  
}