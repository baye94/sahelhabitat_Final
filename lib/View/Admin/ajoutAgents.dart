import 'package:flutter/material.dart';
import 'package:sahelhabitat/View/SideBarNavigation/pages/homepage.dart';

class ajoutAgents extends StatefulWidget {
  @override
  _ajoutAgentsState createState() => _ajoutAgentsState();
}

class _ajoutAgentsState extends State<ajoutAgents> {
  

  
  @override
  Widget build(BuildContext context) {
    var _forminskey;
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
          body: SingleChildScrollView(
                  child: Center(
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
                                         
                                       },
                                        
                                       obscureText: true,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                              ),
               
          
        ),
        
      ),
      
    );
  }
}