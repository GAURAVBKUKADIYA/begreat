import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPrimaryButton extends StatefulWidget {


  var buttontext="";
  GestureTapCallback onclick;

  MyPrimaryButton({this.buttontext,this.onclick,});

  @override
  State<MyPrimaryButton> createState() => _MyPrimaryButtonState();
}

class _MyPrimaryButtonState extends State<MyPrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap:widget.onclick,

      child: Container(
        alignment: Alignment.center,
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(20)),
            color: Colors.blue
        ),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login",style:TextStyle(color: Colors.white,fontSize: 18)),
            SizedBox(width: 15,),
          ],
        ),
      ),

    );

  }
}
