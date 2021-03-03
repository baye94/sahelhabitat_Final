
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahelhabitat/Service/serviceFirebase.dart';
import 'package:sahelhabitat/View/Authentification/Connexion/connexion.dart';
import 'Animation/FadeAnimation.dart';


// ignore: camel_case_types
class inscription extends StatefulWidget {
  @override
  _inscriptionState createState() => _inscriptionState();
}

// ignore: camel_case_types
class _inscriptionState extends State<inscription> {
  final _forminskey =GlobalKey<FormState>();

  String pass = '' ;
  String  confpass = '';
  String emailU = '';
  int ok =0;
  var resulte ;
   final db = new ServiceFirebase()  ;
   @override
  
   
  @override
  Widget build(BuildContext context) {
    // final usersProvider = Provider.of<UsersProvider>(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.orange[900],
              Colors.orange[800],
              Colors.orange[400]
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Inscription",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "Bienvenue",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        FadeAnimation(
                            1.4,
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(225, 95, 27, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Form(
                                key: _forminskey,
                                child: Column(
                                  children: <Widget>[
                                   
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Email ",
                                            hintStyle:
                                            TextStyle(color: Colors.grey),
                                            border: InputBorder.none
                                        ),
                                        // ignore: missing_return
                                        validator: (val){
                                            if(val.isEmpty){
                                              return 'Ajouter une adresse Email ?';
                                            }
                                            if (val.contains('@')==false) {
                                              return ' il faut respecter le format d\' email @';
                                            }
                                          },
                                       onChanged: (val){
                                         
                                         emailU = val ;
                                       },
                                      ),
                                    ),
                                    
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "mot de pass",
                                            hintStyle:
                                            TextStyle(color: Colors.grey),
                                            border: InputBorder.none
                                        ),
                                        validator: (val) => val.length<6 ? "Password  ave 6 caracactere min?" : null,
                                       onChanged: (val){
                                         pass = val ;
                                       },

                                        obscureText: true,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child:TextFormField(
                                        decoration: InputDecoration(
                                            hintText: " Confirmer mot de pass",
                                            hintStyle:
                                            TextStyle(color: Colors.grey),
                                            border: InputBorder.none
                                        ),
                                        onChanged: (val){
                                         confpass = val ;
                                       },
                                        validator: (val) => confpass != pass ? " les mots de passe ne correspondent pas": null,
                                       obscureText: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                            SizedBox(
                              height: 30,
                            ),
                            
                            FadeAnimation(
                              1.6,
                                            FlatButton (
                                             onPressed: () { 
                                                   if(Platform.isIOS){
                                                      Navigator.push(
                                                   context,
                                                   CupertinoPageRoute(builder: (context) => connexion()),
                                                    );

                                                   }else{
                                                    Navigator.push(
                                                   context,
                                                   MaterialPageRoute(builder: (context) => connexion()),
                                                    );
                                                   }
                                             
                                              },
                                             child: Text(
                                        "j\'ai deja un compte",
                                        style: TextStyle(
                                            color: Colors.orange[900],
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                            ),

                                
                        SizedBox(
                          height: 30,
                        ),


                        FadeAnimation(
                            1.6,
                            Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.orange[900]),
                              child: Center(
                                child: FlatButton(
                                  onPressed:(){
                                  } ,
                                  child:FlatButton (
                                           onPressed: () async { 
                                                if (_forminskey.currentState.validate()) {
                                                   try {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailU,
    password: pass
  );
  if(Platform.isIOS){
    Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => connexion()),
                   );

  }else{
    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => connexion()),
                   );
  }

} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
   _showMyDialog() ;
  }
} catch (e) {
  print(e);
}
 }
                     },
                                           child: Text(
                                      "Inscrire",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),

                                ),
                              ),
                            )),

                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<void> _showMyDialog() async {
  if(Platform.isIOS){
    return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text('Alert error', style: TextStyle(fontWeight: FontWeight.bold , color: Colors.red[900]),),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('ce compte existe deja.'),
              Text('est ce vous pouves utiliser un autre compte svp ?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  }else{
    return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Alert error', style: TextStyle(fontWeight: FontWeight.bold , color: Colors.red[900]),),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('ce compte existe deja.'),
              Text('est ce vous pouves utiliser un autre compte svp ?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  }

}
}

