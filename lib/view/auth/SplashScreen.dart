import 'package:begreat/view/auth/ViewScreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



   var token="";

  gettoken()async{

    Future.delayed(Duration(seconds: 5),(){

      FirebaseMessaging.instance.getToken().then((value)  async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("token", value);
        if(prefs.containsKey("islogin"))
          {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>ViewScreen())
            );
          }
        else
          {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>LoginScreen())
            );
          }

      });

    });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettoken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          child: Column(
            children: [

              Center(child: CircularProgressIndicator(),),
            ],
          ),
        ),
      ),
    );
  }
}
