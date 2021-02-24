import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:sahelhabitat/Model/terrainModel.dart';
import 'package:sahelhabitat/Provider/terrain_provider.dart';
import 'package:sahelhabitat/View/Admin/SideBarNavigationAdmin/pages/myorderspage.dart';
class EditTerrain extends StatefulWidget {
  final TerrainModel terrainModel;
  EditTerrain([this.terrainModel]);
   @override
  _EditTerrainState createState() => _EditTerrainState();
}

class _EditTerrainState extends State<EditTerrain> {
final localiteController = TextEditingController();
final surfaceController = TextEditingController();
final prixController = TextEditingController();
final suffixePrixController = TextEditingController();
final suffixeSurfaceController = TextEditingController();
final descriptionController = TextEditingController();
final phototoController = TextEditingController();
@override
 void dispose() {
    localiteController.dispose();
    surfaceController .dispose();
    prixController.dispose();
    suffixePrixController.dispose();
    suffixeSurfaceController .dispose();
    descriptionController.dispose();
    phototoController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    if (widget.terrainModel == null) {
      //New Record
     localiteController.text = "";
      surfaceController.text = "";
      prixController.text= "";
      suffixePrixController.text = "";
      suffixeSurfaceController.text ="";
      descriptionController.text ="";
      phototoController.text = "" ;
            new Future.delayed(Duration.zero, () {
        // final productProvider = Provider.of<ProductProvider>(context,listen: false);
         final agentProvider = Provider.of<TerrainProvider>(context,listen: false);
        agentProvider.loadValues(TerrainModel());
      });
    } else {
      //Controller Update
      localiteController.text  = widget.terrainModel.localiteTerrain;
       surfaceController.text =widget.terrainModel.surface.toString();
       prixController.text= widget.terrainModel.prixTerrain.toString();
       suffixePrixController.text  = widget.terrainModel.devicePrixTerrain;
        suffixeSurfaceController.text = widget.terrainModel.suffixeSurface;
        descriptionController.text = widget.terrainModel.descriptionTerrain;
      phototoController.text = widget.terrainModel.urlPhotoTerrain;
      //State Update
      new Future.delayed(Duration.zero, () {
        
        final agentProvider = Provider.of<TerrainProvider>(context,listen:false);
        agentProvider.loadValues(widget.terrainModel);
      });
      
    }

    super.initState();

  }
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
                          child: 
                          // ( imageAgentAvantSAve!=null)?Image.file(
                          //   File(imageAgentAvantSAve.path),
                          //   fit: BoxFit.fill,
                          // ):
                          CachedNetworkImage(
                             imageUrl: phototoController.text ,
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.low,
                          ),
                        ),
                      ),
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
                                          controller: localiteController,
                                            decoration: InputDecoration(
                                                hintText: "Localite  ",
                                                hintStyle:
                                                TextStyle(color: Colors.grey),
                                                border: InputBorder.none,
                                               
                                            ),
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
                                          controller: surfaceController,
                                            decoration: InputDecoration(
                                                hintText: "Superficie ",
                                                hintStyle:
                                                TextStyle(color: Colors.grey),
                                                border: InputBorder.none,
                                               
                                            ),
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
                                          controller: suffixeSurfaceController,
                                            decoration: InputDecoration(
                                                hintText: "Prefixe superficie exemple: m2 ",
                                                hintStyle:
                                                TextStyle(color: Colors.grey),
                                                border: InputBorder.none,
                                               
                                            ),
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
                                          controller: prixController,
                                            decoration: InputDecoration(
                                                hintText: "Prix",
                                                hintStyle:
                                                TextStyle(color: Colors.grey),
                                                border: InputBorder.none,
                                               
                                            ),
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
                                          controller: suffixePrixController,
                                            decoration: InputDecoration(
                                                hintText: "Prefixe prix exemple: fcfa ",
                                                hintStyle:
                                                TextStyle(color: Colors.grey),
                                                border: InputBorder.none,
                                               
                                            ),
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
                                           readOnly: true,
                                          controller: phototoController,
                                            decoration: InputDecoration(
                                                hintText: " photo",
                                                hintStyle:
                                                TextStyle(color: Colors.grey),
                                                border: InputBorder.none,
                                                
                                            ),
                                          
                                            validator: (val){
                                              // val = imageAgentAvantSAve.path;
                                              if(val.isEmpty){
                                                  return ' Photo';
                                                }
                                                 },

                                           onChanged: (value){
                                             value =imageUrl;
                                             terrainProvider.changeUrlPhoto(value);
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
                                          controller: descriptionController,
                                          maxLines: 20,
                                            decoration: InputDecoration(
                                                hintText: "Description ",
                                                hintStyle:
                                                TextStyle(color: Colors.grey),
                                                border: InputBorder.none,
                                               
                                            ),
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
                                        // await uploadImage(terrainProvider.idT);
                                       if (_frisky2.currentState.validate()){
                                        await terrainProvider.saveTerrain();
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MyOrdersPage() ));
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