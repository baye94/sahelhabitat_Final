import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sahelhabitat/Model/terrainModel.dart';
import 'package:sahelhabitat/Provider/terrain_provider.dart';

class DetailTerrain extends StatefulWidget {
  final TerrainModel terrainModel;
  DetailTerrain([this.terrainModel]);
  @override
  _DetailTerrainState createState() => _DetailTerrainState();
}

class _DetailTerrainState extends State<DetailTerrain> {
  TerrainProvider terrainProvider = TerrainProvider();
  @override
  Widget build(BuildContext context) {
    modal(String text,String photo){
 if(Platform.isIOS){
   return     showCupertinoModalBottomSheet(
  context: context,
  builder: (context) {
      return SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Container(
          color: Colors.white,
          width:MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/2,
          child: SingleChildScrollView(
                      child: Column(
              children:[
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 50,
                  child:CachedNetworkImage(
                    imageUrl:photo,
                    fit: BoxFit.cover,

                  )
                  
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
          height: MediaQuery.of(context).size.height/1.9,
          child: SingleChildScrollView(
                      child: Column(
              children:[
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 50,
                   child:CachedNetworkImage(
                    imageUrl:photo,
                    fit: BoxFit.cover,

                  )
                  
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
          ),
        )
      );
  },
);
 }
   }
    
    return Scaffold(
       body: Center(
        child:CustomScrollView(
          slivers: [
             SliverAppBar(
              // title: Text(widget.agentModel.nomCompletAgent),
              backgroundColor: Colors.white,
              actions: <Widget>[
                        Image(image: AssetImage('assets/logo.png'),
                          width: 100,
                          height: 100,
                          ),
                        
                      ],
              expandedHeight: 350.0,
              pinned: true,
              floating: true,
              snap: true,
              flexibleSpace: FlexibleSpaceBar(
                background: CachedNetworkImage(
               imageUrl:widget.terrainModel.urlPhotoTerrain , 
                  fit: BoxFit.cover,
                  
                  ),
                  
               
              ),
            ),
          
               SliverFixedExtentList(
              itemExtent: 50.00,
              delegate: SliverChildListDelegate([
               
                 SizedBox(height:00),
                Card(
                 elevation: 5,
                //  shadowColor: Colors.orange,
        child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                 Text(
                  (widget.terrainModel.localiteTerrain),
                   style: TextStyle(fontWeight: FontWeight.bold , ),
                  
                ),
                 Icon(
                  Icons.location_on,
                  color: Colors.orange,
                  ),
                   ],
            ),
      ),
      
           Card(
                 elevation: 5,
                //  shadowColor: Colors.orange,
        child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                    ('${widget.terrainModel.prixTerrain.toString()}'),
                     style: TextStyle(fontWeight: FontWeight.bold),
                    
                  ),
                  Text('\$' ,style: TextStyle(fontWeight: FontWeight.bold , color: Colors.orange , fontSize: 25),)
               
              ],
            ),
      ),
        Card(
                 elevation: 5,
               
        child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                 Text(
                  // 
                  (' ${widget.terrainModel.surface.toString()} ${widget.terrainModel.suffixeSurface}'),
                   style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.landscape,
                  color: Colors.orange,
                  
                ),  
              ],
            ),
      ),
          TextButton(
            // color: Colors.white,
            onPressed: (){
             modal('${widget.terrainModel.descriptionTerrain}', widget.terrainModel.urlPhotoTerrain);
            },
            child: Text('Description',
            style: TextStyle( fontWeight: FontWeight.bold,color: Colors.orange),
            ),
            ),    
    
            

              ]
              
              ),
               
            ),
           
          ],
        )
      ),
      
    );
  }

}