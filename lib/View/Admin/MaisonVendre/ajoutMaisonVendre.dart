import 'package:flutter/material.dart';

class AjoutMaisonVendre extends StatefulWidget {
  @override
  _AjoutMaisonVendreState createState() => _AjoutMaisonVendreState();
}

class _AjoutMaisonVendreState extends State<AjoutMaisonVendre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
            actions: <Widget>[
            Image(image: AssetImage('assets/logo.png'),
            width: 100,
              height: 100,
              
            ),
          ]
      ),
    );
  }
}