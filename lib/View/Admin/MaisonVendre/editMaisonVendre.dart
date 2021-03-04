import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:sahelhabitat/Model/maisonVendre.dart';
import 'package:sahelhabitat/Provider/maison_provider.dart';


class EditeMaisonVendre extends StatefulWidget {
   final MaisonVendre maisonVendre;
  EditeMaisonVendre([this.maisonVendre]);
  @override
  _EditeMaisonVendreState createState() => _EditeMaisonVendreState();
}

class _EditeMaisonVendreState extends State<EditeMaisonVendre> {
final localiteController = TextEditingController();
final paysController = TextEditingController();
final prixController = TextEditingController();
final deviceController = TextEditingController();
final surfaceController = TextEditingController();
final sufficeController = TextEditingController();
final garage = TextEditingController();
final nombreChambre = TextEditingController();
final anneConstruction = TextEditingController();
final description = TextEditingController();
final nombreSalleBains = TextEditingController();

@override
  void dispose() {
    localiteController .dispose();
    paysController .dispose();
    prixController .dispose();
    deviceController.dispose();
    surfaceController.dispose();
    sufficeController.dispose();
    garage.dispose();
    nombreChambre.dispose();
    anneConstruction.dispose();
    description.dispose();
    nombreSalleBains.dispose();
    super.dispose();
  }
   @override
  void initState() {
    if (widget.maisonVendre == null) {
      //New Record
      localiteController .text = "";
      paysController.text = "";
      prixController.text= "";
      deviceController.text = "" ;
      surfaceController.text="";
      sufficeController.text="";
      garage.text="";
      nombreChambre.text="";
      anneConstruction.text = "";
      description.text ="";
      nombreSalleBains.text ="";
            new Future.delayed(Duration.zero, () {
        // final productProvider = Provider.of<ProductProvider>(context,listen: false);
         final agentProvider = Provider.of<MaisonVendreProvider>(context,listen: false);
        agentProvider.loadValues(MaisonVendre());
      });
    } else {
      //Controller Update
      localiteController .text=widget.maisonVendre.localiteMaisonVendre;
      paysController.text=widget.maisonVendre.paysMaisonVendre;
      prixController.text = widget.maisonVendre.prixMaisonVendre.toString();
      deviceController.text = widget.maisonVendre.deviceMaisonVendre;
      surfaceController.text = widget.maisonVendre.surfaceMaisonVendre.toString();
      sufficeController.text = widget.maisonVendre.suffixSurfaceMaisonVendre;
      garage.text = widget.maisonVendre.garageMaisonVendre.toString();
      nombreChambre.text = widget.maisonVendre.nombreChambreMaisonVendre.toString();
      anneConstruction.text  = widget.maisonVendre.anneeConstructionMaisonVendre.toString();
      description.text = widget.maisonVendre.description;
      nombreSalleBains.text = widget.maisonVendre.nombreSalleBains;
      //State Update
      new Future.delayed(Duration.zero, () {
        
        final agentProvider = Provider.of<MaisonVendreProvider>(context,listen:false);
        agentProvider.loadValues(widget.maisonVendre);
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
        .child('Maison A vendre/$agent')
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
      final maisonVendreProvider = Provider.of<MaisonVendreProvider>(context);

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
                          child:Image.network(
                           widget.maisonVendre.urlPhotoMaisonVendre,
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.low,
                          )
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 100.0),
                    // child: IconButton(
                    //   icon: Icon(
                    //     FontAwesomeIcons.camera,
                    //     size: 30.0,
                    //     color: Colors.orange[900],
                    //   ),
                    //   onPressed: () {
                    //     getImage2();
                       
                    //   },
                    // ),
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
                                            // ignore: missing_return
                                            validator: (val){
                                                if(val.isEmpty){
                                                  return ' Localite';
                                                }
                                              
                                              },
                                           onChanged: (value){
                                             maisonVendreProvider.changeLocaliteMaisonV(value);
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
                                          controller: paysController,
                                            decoration: InputDecoration(
                                                hintText: "Pays",
                                                hintStyle:
                                                TextStyle(color: Colors.grey),
                                                border: InputBorder.none,
                                               
                                            ),
                                            // ignore: missing_return
                                            validator: (val){
                                                if(val.isEmpty){
                                                  return ' Pays';
                                                }
                                              
                                              },
                                           onChanged: (value){
                                          
                                            maisonVendreProvider.changePaysMainsonV(value);
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
                                            // ignore: missing_return
                                            validator: (val){
                                                if(val.isEmpty){
                                                  return ' superficie';
                                                }
                                              
                                              },
                                           onChanged: (value){
                                              // terrainProvider.changeSurface(double.parse(value));
                                              maisonVendreProvider.changeSurfaceMaisonV(value);
                                            
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
                                          controller: sufficeController,
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
                                            maisonVendreProvider.changeSuffixeSurfaceMaisonV(value);
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
                                            // ignore: missing_return
                                            validator: (val){
                                                if(val.isEmpty){
                                                  return ' Prix';
                                                }
                                              
                                              },
                                           onChanged: (value){
                                            //  terrainProvider.changePrixTerrain(double.parse(value));
                                            maisonVendreProvider.changePrixMaisonV(value);
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
                                          controller: deviceController,
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
                                            maisonVendreProvider.changeDeviceMaisonV(value);
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
                                          controller: garage,
                                            decoration: InputDecoration(
                                                hintText: "Garage",
                                                hintStyle:
                                                TextStyle(color: Colors.grey),
                                                border: InputBorder.none,
                                               
                                            ),
                                            // ignore: missing_return
                                            validator: (val){
                                                if(val.isEmpty){
                                                  return ' Garage';
                                                }
                                              
                                              },
                                           onChanged: (value){
                                            //  terrainProvider.changePrixTerrain(double.parse(value));
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
                                          controller: nombreChambre,
                                            decoration: InputDecoration(
                                                hintText: "Nombre Chambre",
                                                hintStyle:
                                                TextStyle(color: Colors.grey),
                                                border: InputBorder.none,
                                               
                                            ),
                                            // ignore: missing_return
                                            validator: (val){
                                                if(val.isEmpty){
                                                  return ' Nombre chambre';
                                                }
                                              
                                              },
                                           onChanged: (value){
                                           maisonVendreProvider.changeNombreChambreMaison(value);
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
                                          controller: nombreSalleBains,
                                            decoration: InputDecoration(
                                                hintText: "Nombre salle de bains",
                                                hintStyle:
                                                TextStyle(color: Colors.grey),
                                                border: InputBorder.none,
                                               
                                            ),
                                            // ignore: missing_return
                                            validator: (val){
                                                if(val.isEmpty){
                                                  return ' Nombre salle de bains';
                                                }
                                              
                                              },
                                           onChanged: (value){
                                           maisonVendreProvider.changeNombreChambreMaison(value);
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
                                          controller: anneConstruction,
                                            decoration: InputDecoration(
                                                hintText: "Annee de Construction",
                                                hintStyle:
                                                TextStyle(color: Colors.grey),
                                                border: InputBorder.none,
                                               
                                            ),
                                            // ignore: missing_return
                                            validator: (val){
                                                if(val.isEmpty){
                                                  return ' Annee construction';
                                                }
                                              
                                              },
                                           onChanged: (value){
                                          maisonVendreProvider.changeAnneContructionMaisonV(value);
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
                                          controller: description,
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
                                             maisonVendreProvider.changeDescriptionMaisonV(value);
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
                                      
                                        // await uploadImage(maisonVendreProvider.localiteMV);
                                        maisonVendreProvider.changeUrlPhotoMaisonV(widget.maisonVendre.urlPhotoMaisonVendre);
                                         
                                       if (_frisky2.currentState.validate()){
                                        await maisonVendreProvider.saveMaisonVendre();
                                        Navigator.of(context).pop();
                    //  Navigator.of(context).push(MaterialPageRoute(builder: (contex) => MyOrdersPageAdmin()));
                                     
                                    
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