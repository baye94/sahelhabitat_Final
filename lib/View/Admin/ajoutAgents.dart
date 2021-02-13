import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sahelhabitat/Provider/agent_provider.dart';
import 'package:provider/provider.dart';

class ajoutAgents extends StatefulWidget {
  @override
  _ajoutAgentsState createState() => _ajoutAgentsState();
}

class _ajoutAgentsState extends State<ajoutAgents> {
  
String imageUrl;
   uploadImage() async {
    FirebaseStorage _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;


    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted){
      //Select Image
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null){
        //Upload to Firebase
        var snapshot = await _storage.ref()
        .child('Agents/imageName')
        .putFile(file);
        // .onComplete;
        // snapshot t = await snapshot.onComplete

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No Path Received');
      }

    } else {
      print('Grant Permissions and try again');
    }

    

    
  }
  @override
  Widget build(BuildContext context) {
    final agentProvider = Provider.of<AgentProvider>(context);
    var _forminskey;
        File _image;
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
                            child: Column(
                              children:<Widget> [
                                   SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.orange[900],
                      child: ClipOval(
                        child: new SizedBox(
                          width: 185.0,
                          height: 185.0,
                          child: (_image!=null)?Image.file(
                            _image,
                            fit: BoxFit.fill,
                          ):Image.network(
                            "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10,top: 120.0),
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.camera,
                        size: 30.0,
                        color: Colors.orange[900],
                      ),
                      onPressed: () {
                        // getImage();
                        uploadImage() ;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
                                         Form(
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
                                              hintText: "Nom complet  ",
                                              hintStyle:
                                              TextStyle(color: Colors.grey),
                                              border: InputBorder.none
                                          ),
                                          validator: (val){
                                              if(val.isEmpty){
                                                return ' Nom complet';
                                              }
                                              
                                            },
                                         onChanged: (value){
                                            agentProvider.changeNomAgent(value);
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
                                              hintText: "Telephone",
                                              hintStyle:
                                              TextStyle(color: Colors.grey),
                                              border: InputBorder.none
                                          ),
                                           validator: (val){
                                              if(val.isEmpty){
                                                return 'Telephone';
                                              }
                                              
                                            },
                                         onChanged: (value){
                                            agentProvider.changeTelephoneAgent(value);
                                         },
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
                                              hintText: "Email",
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
                                         onChanged: (value){
                                           agentProvider.changeEmail(value);
                                          
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
                                              hintText: " Pays residence",
                                              hintStyle:
                                              TextStyle(color: Colors.grey),
                                              border: InputBorder.none
                                          ),
                                          validator: (val){
                                              if(val.isEmpty){
                                                return 'Pays residence';
                                              }
                                              
                                            },
                                         onChanged: (value){
                                            agentProvider.changePaysAgent(value);
                                         },
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
                                              hintText: " photo",
                                              hintStyle:
                                              TextStyle(color: Colors.grey),
                                              border: InputBorder.none
                                          ),
                                          validator: (val){
                                              if(val.isEmpty){
                                                return ' Photo';
                                              }
                                              
                                            },
                                         onChanged: (value){
                                            agentProvider.changeUrlPhoto(value);
                                         },
                                        ),
                                        
                                      ),
                                        SizedBox(
                          height: 30,
                        ),
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
                                       onPressed: () { 
                                         agentProvider.saveAgent();   
                                        },
                                                      child: Text(
                                        "Ajouter Agent",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),

                                  ),
                                ),
                              ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
               
          
        ),
        
      ),
      
    );
  }
}