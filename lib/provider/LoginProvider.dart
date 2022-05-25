import 'dart:convert';

import 'package:begreat/models/UserData.dart';
import 'package:begreat/resources/UrlResources.dart';
import 'package:begreat/utility/ApiHandler.dart';
import 'package:begreat/view/other/NoInterNet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/error_handler.dart';

class LoginProvider extends ChangeNotifier{

  var islogin=false;
  var msg="";
  UserData userobj;

  login(params,header,context)async {
    try{
      await ApiHandler.post(UrlResources.LOGIN,body: jsonEncode(params),headers: header).then((json){
        if(json["result"]=="success")
          {
            islogin=true;
            msg=json["message"];
            userobj = UserData.fromJson(json["data"]);
          }
        else
          {
            islogin=false;
            msg=json["message"];
          }
      });
    }
    on ErrorHandler catch (ex)
    {
      if (ex.code.toString() == "500")
      {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>NoInterNet())
        );
      }
    }
  }


}