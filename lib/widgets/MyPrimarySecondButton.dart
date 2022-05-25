import 'package:flutter/material.dart';

class MyPrimarySecondButton extends StatefulWidget {


  var buttontext="";
  GestureTapCallback onclick;

  MyPrimarySecondButton({this.buttontext,this.onclick});

  @override
  State<MyPrimarySecondButton> createState() => _MyPrimarySecondButtonState();
}

class _MyPrimarySecondButtonState extends State<MyPrimarySecondButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:widget.onclick,

      child: Container(
        alignment: Alignment.center,
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(20)),
            color: Colors.red
        ),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("LogOut",style:TextStyle(color: Colors.white,fontSize: 18)),
            SizedBox(width: 15,),
          ],
        ),
      ),

    );
  }
}
