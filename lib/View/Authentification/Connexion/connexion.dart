
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sahelhabitat/Service/serviceFirebase.dart';
import 'package:sahelhabitat/View/Admin/SideBarNavigationAdmin/sidebar/sidebar_layout.dart';
import 'package:sahelhabitat/View/Authentification/Inscription/Animation/FadeAnimation.dart';
import 'package:sahelhabitat/View/Authentification/Inscription/inscription.dart';
import 'package:sahelhabitat/View/Authentification/resetPassword.dart';
import 'package:sahelhabitat/View/SideBarNavigation/sidebar/sidebar_layout.dart';
class connexion extends StatefulWidget {
   @override
  _connexionState createState() => _connexionState();
}
class _connexionState extends State<connexion> {
  final _forminskey =GlobalKey<FormState>();
  String _emailC ;
  String _passC;
   var resulte ;
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
                  FadeAnimation(
                      1,
                      Text(
                        "Registe",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "Welcome Back",
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
                                          validator: (val){
                                            if(val.isEmpty){
                                              return ' Email ?';
                                            }
                                            if (val.contains('@')==false) {
                                              return ' respect email foromat @';
                                            }
                                          },
                                          
                                       onChanged: (val){
                                         _emailC= val ;
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
                                            hintText: "Password",
                                            hintStyle:
                                            TextStyle(color: Colors.grey),
                                            border: InputBorder.none
                                        ),
                                         validator: (val) => val.length<6 ? "Password  ave 6 caracactere min?" : null,
                                       onChanged: (val){
                                         _passC = val ;
                                       },

                                        obscureText: true,
                                      ),
                                    ),
                                   
                                  ],
                                ),
                              ),
                            )),
                              SizedBox(
                              height: 0,
                             
                            ),
                            
                            FlatButton (
                                           onPressed: () { 
                                                 Navigator.push(
                                                 context,
                                                 MaterialPageRoute(builder: (context) => resetPassword()),
                                                  );
                                           
                                            },
                                           child: Text(
                                      " forget password?",
                                      style: TextStyle(
                                          color: Colors.orange[900],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                            SizedBox(
                              height: 30,
                            ),
                            
                            FlatButton (
                                           onPressed: () { 
                                                 Navigator.push(
                                                 context,
                                                 MaterialPageRoute(builder: (context) => inscription()),
                                                  );
                                           
                                            },
                                           child: Text(
                                      "create compte?",
                                      style: TextStyle(
                                          color: Colors.orange[900],
                                          fontWeight: FontWeight.bold),
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
                                  child: FlatButton(
                                      onPressed: () async { 
                                         print('aye cheikh fall is the best');
                                             if (_forminskey.currentState.validate()) {
                                             try {
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _emailC,
    password: _passC
  );
  if(_emailC=="admin@sahelhabitat.com" && _passC=="admin@2021"){
     Navigator.push(
    context,
     MaterialPageRoute(builder: (context) => SideBarLayoutAdmin()),
     );

  }else
   Navigator.push(
    context,
     MaterialPageRoute(builder: (context) => SideBarLayout()),
     );
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    _showMyDialog('le compte néxiste pas .' ,
    'est ce vous pouvez creer un autre compte svp ?'
    );
    // print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    _showMyDialog('çe mot de pass ne correspond a aucune compte', 
    'veuillez verifier votre ou emander un autre password23453');
    // print('Wrong password provided for that user.');
    // return " password faux";
  }
}
                                             }
                                              
 
            //  db.SaveUsers('fallcheikh893@gmail.com', 'dssdfsd');
                                            },
  //                                                onPressed: () {  
                                                    
  //                                                    Navigator.push(
  //                                                context,
  //                              MaterialPageRoute(builder: (context) => SideBarLayout()),
                             
  // );
  //                                                },
                                                  
                                                    child: Text(
                                      "Register",
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
   Future<void> _showMyDialog(String phrase1 , String phrase2) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Alert error', style: TextStyle(fontWeight: FontWeight.bold , color: Colors.red[900]),),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(phrase1),
              Text(phrase2),
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