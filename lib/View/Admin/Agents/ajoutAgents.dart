
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sahelhabitat/Provider/agent_provider.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class ajoutAgents extends StatefulWidget {
  
  @override
  _ajoutAgentsState createState() => _ajoutAgentsState();
}

// ignore: camel_case_types
class _ajoutAgentsState extends State<ajoutAgents> {
 
// String imageUrl='https://firebasestorage.googleapis.com/v0/b/projetsahelhabitat.appspot.com/o/Agents%2Flogo.png?alt=media&token=322ba732-b926-494e-bdb0-f616a3a77b7d' ;
String imageUrl;
String photo ="";
FirebaseStorage _storage = FirebaseStorage.instance;
final _picker = ImagePicker();
 File _image ;
 File imageAgentAvantSAve;
PickedFile image;
String downloadUrl ;
final _frisky2 = GlobalKey<FormState>();

 Future getImage2() async {
     await Permission.photos.request();
     var permissionStatus = await Permission.photos.status;
     if(permissionStatus.isGranted){
       image = await _picker.getImage(source: ImageSource.gallery);
       _image = File(image.path) ;
      // imageAgentAvantSAve =_image ;
       setState(() {
         imageAgentAvantSAve =_image ;
         });
     }
     

    }
 uploadImage(String agent) async {
   
   Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted){
      
      if ( imageAgentAvantSAve.path.isNotEmpty){
       
        TaskSnapshot snapshot = await _storage.ref()
        .child('Agents/$agent')
        .putFile(imageAgentAvantSAve)
        ;
        downloadUrl =  await snapshot.ref.getDownloadURL();
         
          
      //  imageUrl = downloadUrl;
      
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
                          child: ( imageAgentAvantSAve!=null)?Image.file(
                            File(imageAgentAvantSAve.path),
                            fit: BoxFit.fill,
                          ):Image.network(
                            "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.low,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 100.0),
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.camera,
                        size: 30.0,
                        color: Colors.orange[900],
                      ),
                      onPressed: () {
                        getImage2();
                       
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
                                         Center(
                                           child: Form(
                                             
                                             key: _frisky2,
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
                                                border: InputBorder.none,
                                               
                                            ),
                                            // ignore: missing_return
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
                                             // ignore: missing_return
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
                                           
                                            // ignore: missing_return
                                            validator: (val){
                                                if(val.isEmpty){
                                                  return ' Email ?';
                                                }
                                                else if (val.contains('@')==false) {
                                                  return ' respect email foromat @';
                                                }
                                              },
                                           onChanged: (value){
                                             agentProvider.changeEmail(value);
                                            
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
                                                hintText: " Pays residence",
                                                hintStyle:
                                                TextStyle(color: Colors.grey),
                                                border: InputBorder.none
                                            ),
                                            // ignore: missing_return
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
                                                border: InputBorder.none,
                                                
                                            ),
                                          
                                            // ignore: missing_return
                                            validator: (val){
                                              val = imageAgentAvantSAve.path;
                                              if(val.isEmpty){
                                                  return ' Photo';
                                                }
                                              //  imageUrl =  uploadImage(agentProvider.nomA);
                                               agentProvider.changeUrlPhoto( imageUrl );
                                              //  uploadImage(agentProvider.nomA);
                                              

                                              },

                                          //  onChanged: (value){
                                          //    value = "fall";
                                          //    agentProvider.changeUrlPhoto(value);
                                          //  },
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
                                  child: TextButton(
                                   
                                     onPressed: ()  async{
                                        await uploadImage(agentProvider.nomA);
                                       if (_frisky2.currentState.validate()){
                                        agentProvider.saveAgent();
                                        print(agentProvider.idA);
                                         Navigator.of(context).pop();
                                    
                                              }
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
                                    ],
                                  ),
                                ),
                                         ),
                              ],
                            ),
               
          
        ),
        
      ),
      
    );
  }
}