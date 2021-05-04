import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:sahelhabitat/Model/agentModel.dart';
import 'package:sahelhabitat/Model/terrainModel.dart';
import 'package:sahelhabitat/View/SideBarNavigation/pages/test.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
// ignore: must_be_immutable
class HomePage extends StatelessWidget with NavigationStates {
  CarouselController buttonCarouselController = CarouselController();
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
     modal(String image , String text){
 if(Platform.isIOS){
   return     showCupertinoModalBottomSheet(
  context: context,
  builder: (context) {
      return SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Container(
          color: Colors.white,
          width:MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/4,
          child: Column(
            children:[
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 50,
                child:Image(image: AssetImage(image),
                fit: BoxFit.cover,
                ),
                
                ),
                 SizedBox(
                height: 10,
              ),
                Divider(),
                 SizedBox(
                height: 10,
              ),
                Text(text,
                textAlign:TextAlign.justify,
                style: TextStyle(fontSize: 15 ,color: Colors.grey , decoration: TextDecoration.none , fontStyle:FontStyle.italic , fontWeight: FontWeight.normal),
                ),
                
            ]
          ),
        )
      );
  },
);
 }else{
    return     showMaterialModalBottomSheet(
  context: context,
  builder: (context) {
      return SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Container(
          color: Colors.white,
          width:MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/4,
          child: Column(
            children:[
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 50,
                child:Image(image: AssetImage(image),
                fit: BoxFit.cover,
                ),
                
                ),
                 SizedBox(
                height: 10,
              ),
                Divider(),
                 SizedBox(
                height: 10,
              ),
                Text(text,
                textAlign:TextAlign.justify,
                style: TextStyle(fontSize: 15 ,color: Colors.grey , decoration: TextDecoration.none , fontStyle:FontStyle.italic , fontWeight: FontWeight.normal),
                ),
                
            ]
          ),
        )
      );
  },
);
 }
   }
      final terrains = Provider.of<List<TerrainModel>>(context);
      final  listeTerrains = terrains?.map((item) => Container(
      
  child:   Card(
    child: Column(
      children: [
        Container(
          // color: Colors.blue,
          height: 160,
          width: 500,
         
          child: CachedNetworkImage(
                              fit: BoxFit.cover,
                             
                               imageUrl: item.urlPhotoTerrain,
                               errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
        ),

        ListTile(
          title: Text(item.localiteTerrain,
              style: TextStyle(fontWeight: FontWeight.w500)),
          leading: Icon(
            Icons.location_on,
            color: Colors.orange,
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text(item.prixTerrain.toString()),
            leading: Text(
              '\$',
              style: TextStyle(color:Colors.orange ,fontWeight:FontWeight.bold , fontSize:25,),
             
            ),
          ),
        ),
      ],
    ),
  ),
),)?.toList()??[];
Future<bool> _onBackPressed(){
 return showDialog(
   context: context,
   builder: (context) {
    if(Platform.isIOS){
       return
     CupertinoAlertDialog(
     title: Text('Vous voullez quitter l\'application'),
     actions: [
       // ignore: deprecated_member_use
       FlatButton(
         onPressed:()=>Navigator.pop(context , false), 
         child: Text('No')),
           // ignore: deprecated_member_use
           FlatButton(
        //  onPressed:()=>Navigator.pop(context , true), 
         onPressed:()=>exit(0), 
         child: Text('Oui'))
     ],
   );
    }else{
       return
     AlertDialog(
     title: Text('Vous voullez quitter l\'application'),
     actions: [
       // ignore: deprecated_member_use
       FlatButton(
         onPressed:()=>Navigator.pop(context , false), 
         child: Text('No')),
           // ignore: deprecated_member_use
           FlatButton(
         onPressed:()=>exit(0), 
         child: Text('Oui'))
     ],
   );
    }
   
   }
   );

}
    return WillPopScope(
           onWillPop: _onBackPressed,
          child: Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            // title: new  Text("fall"),
            // leading:  Image.asset('assets/logo.png', height: 52.0,),
            actions: <Widget>[
              Image(image: AssetImage('assets/logo.png'),
                // fit: BoxFit.values(100,122),
                width: 100,
                height: 100,
              ),
            ]

        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
               
                SizedBox(height: 30,),
                Text('AGENTS' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                SizedBox(height: 30,),
                CarouselSlider(
                  options: CarouselOptions(
                    // height: 420.0,
                    height: MediaQuery.of(context).size.height/2,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,),
                //  carouselController: buttonCarouselController,
                  
                  items: Provider.of<List<AgentModel>>(context)?.map((i) {
                    return Builder(
                      builder:(BuildContext context) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              Card(
                                // elevation: 10.9,
                                child: Column(
                                   children: [
                                     Container(
                                     height: 100,
                                     width: 100,
                                      child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  
                                   imageUrl:i.urlPhotoAgant,

                                  //  errorWidget: (context, url, error) => Icon(Icons.error),
),
                                     decoration: BoxDecoration(
                                         color: Colors.white,
                                         borderRadius: BorderRadius.all(Radius.circular(5)),
                                         boxShadow: [
                                           BoxShadow(
                                             color:Colors.orange[600],

                                             offset: Offset(4.0,4.0),
                                             blurRadius: 0.0,
                                             spreadRadius: 0.0,
                                             // color: Colors.white.withOpacity(.7)
                                           ),
                                           BoxShadow(
                                             color:Colors.orange[600],
                                             offset: Offset(4.0,4.0),
                                             blurRadius: 0.0,
                                             spreadRadius: 0.0,
                                             // color: Colors.black.withOpacity(.15)

                                           ),
                                         ]
                                     ),
                                   ),
                                    ListTile(
                                      title: Text(i.nomCompletAgent, textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500)),
                                      subtitle: Text(i.paysAgent,textAlign: TextAlign.center),
                                    
                                    ),
                                    Divider(),
                                    ListTile(
                                      title: Text(i.telephoneAgent,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500)),
                                      leading: Icon(
                                        Icons.phone,
                                        color: Colors.orange[600],
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(i.emailAgent,),
                                      leading: Icon(
                                        Icons.mail,
                                        color: Colors.orange[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // ignore: deprecated_member_use
                              RaisedButton(
                                 onPressed: (){ },
                                  child: Text('→'),
                                // elevation: 10,
                  
                              )
                            ],
                          ),
                        );
                      },
                    );
                  })?.toList()??[],

                ),
                Text('A VENDRE', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                SizedBox(height: 30,),
                Column(
                  children: <Widget>[
                    CarouselSlider(
                       items: listeTerrains,

                      options: CarouselOptions(enlargeCenterPage: true, height: 300),
                      carouselController: _controller,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            onPressed: () => _controller.previousPage(),
                            child: Text('←'),
                          ),
                        ),
                       

                        Flexible(
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            onPressed: () => _controller.nextPage(),
                            child: Text('→'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              SizedBox(height: 30,),
                Text('SERVICES', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                          children: [
                            InkWell(
                              child: InformationTile(content: "assets/rent1.png",name: "Lieu",),
                              onTap: (){
                            modal("assets/rent1.png", "Nous vous donnons un accès privilégié à une liste de biens dans la catégorie location de biens immobiliers: appartement, maison, atelier, parking");
                              },
                            ),
                           InkWell(
                             child: InformationTile(content: "assets/construction1.png",name: "Construction",),
                             onTap: () =>
                             modal("assets/construction1.png", "Construire une maison est un engagement, un rêve de vie, d'argent, de temps, d'avenir. Sahel Habitat vous conseille à chaque étape clé de votre projet.")
                             ,
                           ),
                           InkWell(
                             child:InformationTile(content: "assets/consulting1.png",name: "Consultant",),
                             onTap: () => 
                             modal("assets/consulting1.png", 'Il est important d\'être conseillé et soutenu pour prendre des décisions importantes dans le cadre d\'un projet spécifique.')
                             ,
                           ),
                          InkWell(
                           child:InformationTile(content: "assets/investment1.png",name: "Investissement",),
                           onTap: () =>
                           modal("assets/investment1.png", 'L\'investissement locatif est avant tout une réflexion qu\'il faut relativiser par rapport à son patrimoine existant.')
                           ,
                          ),
                            InkWell(
                             child:InformationTile(content: "assets/land1.png",name: "Achat Terrains",),
                             onTap: () =>
                             modal( "assets/land1.png", 'L\'achat d\'un terrain est un investissement important. Il est donc nécessaire de se renseigner en détail sur ce bien et les procédures à suivre.')
                             ,
                            ),
                            InkWell(
                              child: InformationTile(content: "assets/settings1.png",name: "Intendance",),
                              onTap: () =>
                              modal("assets/settings1.png", 'Confier un mandat de gestion locative vous permet de déléguer tous les travaux de gestion locative à Sahel Habitat.')
                              ,
                            ),
                            ],
                        ),
                      ),
                      
                      
                SizedBox(height: 40,),

              ],
            ),
          ),
        ),
      ),
    );
  }



}

