import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sahelhabitat/Service/serviceFirebase.dart';
import 'package:sahelhabitat/View/Authentification/Inscription/Animation/FadeAnimation.dart';

// ignore: camel_case_types
class resetPassword extends StatefulWidget {
  @override
  _resetPasswordState createState() => _resetPasswordState();
}

// ignore: camel_case_types
class _resetPasswordState extends State<resetPassword> {
   final _forminskey =GlobalKey<FormState>();
  String _emailR ;

   final db = new ServiceFirebase()  ;
  @override
  Widget build(BuildContext context) {
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
                               key: _forminskey ,
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
                                          // validator: (val) => val.isEmpty ? " Email ?" : null,
                                          // ignore: missing_return
                                          validator: (val){
                                            if(val.isEmpty){
                                              return ' Email ?';
                                            }
                                            if (val.contains('@')==false) {
                                              return ' respect email foromat @';
                                            }
                                          },
                                          
                                       onChanged: (val){
                                         _emailR= val ;
                                       },
                                      
                                      ),
                                    ),
                                   
                                  ],
                                ),
                              ),
                            )),
                              SizedBox(
                              height: 30,
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
                                  child: FlatButton(
                                      onPressed: () async { 
                                         
                                             if (_forminskey.currentState.validate()) {
                                             try {
  await FirebaseAuth.instance.sendPasswordResetEmail(email:_emailR);
  Navigator.of(context).pop();
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    
  } else if (e.code == 'wrong-password') {
   
  }
}
                                             }
                                             
                                            },
                                                  
                                                    child: Text(
                                      "Envoyer",
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
}