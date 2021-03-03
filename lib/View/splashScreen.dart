import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sahelhabitat/View/Home/home2.dart';
import 'package:sahelhabitat/View/SideBarNavigation/sidebar/sidebar_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';
String finalemail;
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getValideData().whenComplete(() async{
      Timer(Duration(seconds: 2),() => Get.to(() =>
        finalemail ==null ? home2() :SideBarLayout()
      ));
    });
    super.initState();
    
  }
  Future getValideData() async{
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var obtenirMail = sharedPreferences.getString('email');
  setState(() {
    finalemail =obtenirMail;
  });
  print('Email envoier est $finalemail');
}
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Colors.orange[900],
                Colors.orange[800],
                Colors.orange[700],
                Colors.orange[500],
              ],
             
            ),
          ),
            // decoration: BoxDecoration(color: Colors.orange),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 150.0,
                        child: Image(
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      // Text(
                      //   Flutkart.name,
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 24.0),
                      // )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    // Text(
                    //   Flutkart.store,
                    //   softWrap: true,
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 18.0,
                    //       color: Colors.white),
                    // )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}