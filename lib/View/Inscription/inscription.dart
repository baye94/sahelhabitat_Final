
import 'package:flutter/material.dart';
import 'Animation/FadeAnimation.dart';
import '../../Service/serviceFirebase.dart';

class inscription extends StatefulWidget {
  @override
  _inscriptionState createState() => _inscriptionState();
}

class _inscriptionState extends State<inscription> {
  final _forminskey =GlobalKey<FormState>();

  String _pass , _confpass , _email;
   final db = new serviceFirebase()  ;
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
                                       validator: (val) => val.isEmpty ? " Email ?" : null,
                                       onChanged: (val){
                                         _email = val ;
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
                                        validator: (val) => val.length<6 ? "Password  gave 6 caracactere min?" : null,
                                       onChanged: (val){
                                         _pass = val ;
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
                                            hintText: " Confirm Passord",
                                            hintStyle:
                                            TextStyle(color: Colors.grey),
                                            border: InputBorder.none
                                        ),
                                        onChanged: (val){
                                         _confpass = val ;
                                       },
                                        validator: (val) => _confpass != _pass ? " not correspond pass word": null,
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
                                           onPressed: () { 
                                             if (_forminskey.currentState.validate()) {
                                               
                                             }
  //                                            Navigator.push(
  //                                                context,
  //                              MaterialPageRoute(builder: (context) => connexion()),
  // );
             db.SaveUsers('fallcheikh893@gmail.com', 'dssdfsd');
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
}

