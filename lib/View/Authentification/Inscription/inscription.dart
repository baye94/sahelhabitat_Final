
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sahelhabitat/Service/serviceFirebase.dart';
import 'package:sahelhabitat/View/Authentification/Connexion/connexion.dart';
import 'Animation/FadeAnimation.dart';


class inscription extends StatefulWidget {
  @override
  _inscriptionState createState() => _inscriptionState();
}

class _inscriptionState extends State<inscription> {
  final _forminskey =GlobalKey<FormState>();

  String pass = '' ;
  String  confpass = '';
  String emailU = '';
  int ok =0;
  var resulte ;
   final db = new serviceFirebase()  ;
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
                        "Register",
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
                                        validator: (val){
                                            if(val.isEmpty){
                                              return ' Email ?';
                                            }
                                            if (val.contains('@')==false) {
                                              return ' respect email foromat @';
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
                                            hintText: "Passwod",
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
                                            hintText: " Confirm Passwrd",
                                            hintStyle:
                                            TextStyle(color: Colors.grey),
                                            border: InputBorder.none
                                        ),
                                        onChanged: (val){
                                         confpass = val ;
                                       },
                                        validator: (val) => confpass != pass ? " not correspond pass ggword": null,
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
                            
                            FlatButton (
                                           onPressed: () { 
                                                 Navigator.push(
                                                 context,
                                                 MaterialPageRoute(builder: (context) => connexion()),
                                                  );
                                           
                                            },
                                           child: Text(
                                      "you have compte ?",
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
                                  child:FlatButton (
                                           onPressed: () async { 
                                                if (_forminskey.currentState.validate()) {
                                                   try {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailU,
    password: pass
  );
    Navigator.push(
                      context,
                         MaterialPageRoute(builder: (context) => connexion()),
                         );

} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
   _showMyDialog() ;
  }
} catch (e) {
  print(e);
}
// User user = FirebaseAuth.instance.currentUser;

// if (!user.emailVerified) {
//   await user.sendEmailVerification();
// }

// User user = FirebaseAuth.instance.currentUser;

// if (!user.emailVerified) {

// var actionCodeSettings = ActionCodeSettings(
//         url: 'https://www.example.com/?email=${user.email}',
//         dynamicLinkDomain: "example.page.link",
//         android: {
//           "packageName": "com.example.sahelhabitat",
//           "installApp": true,
//           "minimumVersion": "12"
//         },
//         iOS: {"bundleId": "com.example.sahelhabitat"},
//         handleCodeInApp: true);

// await user.sendEmailVerification(actionCodeSettings);

// }

                                              
                                             }
                                             },
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
  Future<void> _showMyDialog() async {
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

