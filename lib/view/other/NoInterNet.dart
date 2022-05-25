import 'package:flutter/material.dart';

import '../../resources/StyaleResources.dart';

class NoInterNet extends StatefulWidget {


  @override
  State<NoInterNet> createState() => _NoInterNetState();
}

class _NoInterNetState extends State<NoInterNet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("No Internet Conection",style: StyaleResources.primaryTextstyle,),
      ),
    );
  }
}
