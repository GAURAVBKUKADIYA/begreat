import 'package:begreat/helper/LocalHelper.dart';
import 'package:begreat/resources/StyaleResources.dart';
import 'package:begreat/view/auth/ViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../provider/LoginProvider.dart';
import '../../widgets/MyPrimaryButton.dart';

class LoginScreen extends StatefulWidget {


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}




class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _password =  TextEditingController();

  LoginProvider provider;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<LoginProvider>(context,listen: false);


  }


  @override
  Widget build(BuildContext context) {


    Widget _addclick()
    {
      return
        MyPrimaryButton(
          onclick: ()async{
            var name = _name.text.toString();
            var password = _password.text.toString();

            if(name.length<=0)
              {
                Fluttertoast.showToast(
                    msg: "Please Add Name",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }
            else if (password.length<=0)
              {
                Fluttertoast.showToast(
                    msg: "Please Add Your Password",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }

           else{
             SharedPreferences prefs = await SharedPreferences.getInstance();
              Map<String,String> params = {
                "name": name,
                "password": password,
                "device_token": prefs.getString("token").toString(),
                "device_os":"android"
              };


              Map<String,String> header = {
                "Content-Type": "application/json",
              };

              await provider.login(params,header,context);
              if(provider.islogin)
              {
                Fluttertoast.showToast(
                    msg: provider.msg,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("id", provider.userobj.id.toString());
                prefs.setString("name", provider.userobj.name.toString());
                prefs.setString("islogin","yes");

                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>ViewScreen() )
                );

                // await LocalHelper.storeIslogin("yes");
                // print(provider.msg);
                // print(provider.userobj.name.toString());

                //home page
              }
              else
              {
                Fluttertoast.showToast(
                    msg: provider.msg,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }


            }
          },
        );

    }

    Widget _loginform()
    {
      return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("NAME",style: StyaleResources.primaryTextstyle,),
          SizedBox(height: 10,),
          TextField(
            controller: _name,
            decoration: StyaleResources.primaryTexyFeldDecoration,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 10,),
          Text("Password",style: StyaleResources.primaryTextstyle,),
          SizedBox(height: 10,),
          TextField(
            controller: _password,
            decoration: StyaleResources.primaryTexyFeldDecoration,
            keyboardType: TextInputType.text,
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Login Screen"),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              _loginform(),
              SizedBox(height: 10,),
              _addclick(),
            ],
          ),
        ),
      ),
    );
  }
}
