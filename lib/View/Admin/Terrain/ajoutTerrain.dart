import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:sahelhabitat/Provider/terrain_provider.dart';

class AjoutTerrain extends StatefulWidget {
  @override
  _AjoutTerrainState createState() => _AjoutTerrainState();
}

class _AjoutTerrainState extends State<AjoutTerrain> {
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
        .child('Terrains/$agent')
        .putFile(imageAgentAvantSAve)
        ;
        downloadUrl =  await snapshot.ref.getDownloadURL();
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
    final terrainProvider = Provider.of<TerrainProvider>(context);
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
                                                hintText: "Localite  ",
                                                hintStyle:
                                                TextStyle(color: Colors.grey),
                                                border: InputBorder.none,
                                               
                                            ),
                                            // ignore: missing_return
                                            validator: (val){
                                                if(val.isEmpty){
                                                  return ' Localite';
                                                }
                                              
                                              },
                                           onChanged: (value){
                                             terrainProvider.changeLocaliteTerrain(value);
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
                                                hintText: "Superficie ",
                                                hintStyle:
                                                TextStyle(color: Colors.grey),
                                                border: InputBorder.none,
                                               
                                            ),
                                            // ignore: missing_return
                                            validator: (val){
                                                if(val.isEmpty){
                                                  return ' superficie';
                                                }
                                              
                                              },
                                           onChanged: (value){
                                              terrainProvider.changeSurface(double.parse(value));
                                            
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
                                                hintText: "Prefixe superficie exemple: m2 ",
                                                hintStyle:
                                                TextStyle(color: Colors.grey),
                                                border: InputBorder.none,
                                               
                                            ),
                                            // ignore: missing_return
                                            validator: (val){
                                                if(val.isEmpty){
                                                  return ' Prefixe superficie';
                                                }
                                              
                                              },
                                           onChanged: (value){
                                             terrainProvider.changeSuffixeSurface(value);
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
                                                hintText: "Prix",
                                                hintStyle:
                                                TextStyle(color: Colors.grey),
                                                border: InputBorder.none,
                                               
                                            ),
                                            // ignore: missing_return
                                            validator: (val){
                                                if(val.isEmpty){
                                                  return ' Prix';
                                                }
                                              
                                              },
                                           onChanged: (value){
                                             terrainProvider.changePrixTerrain(double.parse(value));
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
                                                hintText: "Prefixe prix exemple: fcfa ",
                                                hintStyle:
                                                TextStyle(color: Colors.grey),
                                                border: InputBorder.none,
                                               
                                            ),
                                            // ignore: missing_return
                                            validator: (val){
                                                if(val.isEmpty){
                                                  return ' Prefixe prix';
                                                }
                                              
                                              },
                                           onChanged: (value){
                                             terrainProvider.changeDevicePrixTerrain(value);
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
                                                terrainProvider.changeUrlPhoto(imageUrl);
                                              //  imageUrl =  uploadImage(agentProvider.nomA);
                                              //  agentProvider.changeUrlPhoto( imageUrl );
                                              //  uploadImage(agentProvider.nomA);
                                              

                                              },

                                          //  onChanged: (value){
                                          //    value = "fall";
                                          //    agentProvider.changeUrlPhoto(value);
                                          //  },
                                        ),
                                        
                                      ),
                                       Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.grey[200]))),
                                        child: TextFormField(
                                          maxLines: 20,
                                            decoration: InputDecoration(
                                                hintText: "Description ",
                                                hintStyle:
                                                TextStyle(color: Colors.grey),
                                                border: InputBorder.none,
                                               
                                            ),
                                            // ignore: missing_return
                                            validator: (val){
                                                if(val.isEmpty){
                                                  return ' description';
                                                }
                                              
                                              },
                                           onChanged: (value){
                                             terrainProvider.changeDescription(value);
                                           },
                                        ),
                                      ),
                                        SizedBox(
                          height: 10,
                        ),
                        Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.orange[900]),
                                child: Center(
                                  child: FlatButton(
                                     onPressed: ()  async{
                                        await uploadImage(terrainProvider.localiteT);
                                       if (_frisky2.currentState.validate()){
                                        await terrainProvider.saveTerrain();
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