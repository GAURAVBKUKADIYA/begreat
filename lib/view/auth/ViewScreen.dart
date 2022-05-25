import 'package:begreat/helper/LocalHelper.dart';
import 'package:begreat/resources/StyaleResources.dart';
import 'package:begreat/widgets/MyPrimarySecondButton.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../provider/LoginProvider.dart';
import 'LoginScreen.dart';

class ViewScreen extends StatefulWidget {
  
  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {

  var name="";
  var id="";


  getdata()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
   setState(() {
     name  = prefs.getString("name").toString();
    id = prefs.getString("id").toString();
   });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();

  }


  @override
  Widget build(BuildContext context) {

    Widget _addclick(){
      return MyPrimarySecondButton(
   onclick: ()async{
     LocalHelper.clearAll();
     Navigator.of(context).pop();
     Navigator.of(context).push(
       MaterialPageRoute(builder: (context)=>LoginScreen())
     );
    },
       );
    }
    return  Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("View Screen"),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(name),

              Text(id),


           _addclick(),
            ],
          ),
        ),
      ),
    );
  }
}
