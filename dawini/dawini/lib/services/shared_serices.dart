

import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:dawini/model/login_res.dart';
import 'package:flutter/cupertino.dart';

class shared_service {

  
  static Future<bool> isloggedin() async {
    final APICacheManager cacheManager = APICacheManager();
    var iskeyexist = 
                await cacheManager.isAPICacheKeyExist("login_details");
                return iskeyexist;
  }

    static Future<LoginResponse?> logindetails() async {
    final APICacheManager cacheManager = APICacheManager();
     var iskeyexist = 
                await cacheManager.isAPICacheKeyExist("login_details");
              if (iskeyexist) {
              var cacheData = APICacheManager().getCacheData("login_data");
              return loginResponseFromJson(cacheData.toString());
              } else { return null;}
            

    }

    // ignore: non_constant_identifier_names
    static Future<void> SetLoginDetails(LoginResponse model,) async {
      // ignore: non_constant_identifier_names
      APICacheDBModel CacheDBModel = APICacheDBModel (key: "login_details", syncData: jsonEncode(model.toJson()));
      await APICacheManager().addCacheData(CacheDBModel);
    }

    static Future<void> logout(BuildContext context) async {
      await APICacheManager().deleteCache("login_details");
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(context,"/login" , (route) => false);
    }
}

