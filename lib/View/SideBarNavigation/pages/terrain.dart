import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sahelhabitat/Model/terrainModel.dart';
import 'package:sahelhabitat/View/SideBarNavigation/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:sahelhabitat/View/SideBarNavigation/pages/detailTerrain.dart';

class TerrainU extends StatefulWidget  with NavigationStates{
  @override
  _TerrainUState createState() => _TerrainUState();
}

class _TerrainUState extends State<TerrainU> {
  @override
  Widget build(BuildContext context) {
   final terrains = Provider.of<List<TerrainModel>>(context);
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
             actions: <Widget>[
              Image(image: AssetImage('assets/logo.png'),
              width: 100,
                height: 100,
                
              ),
            ]
        ),
          body:( terrains !=null ) 
           ? ListView.builder(
              itemCount: terrains.length,
              itemBuilder:(context,index){
           return
          Column(
            children:<Widget> [
              ListTile(
                 onTap: (){
                   if(Platform.isIOS){
                       Navigator.of(context).push(CupertinoPageRoute(builder: (context) =>DetailTerrain(terrains[index])));  

                   }else{
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>DetailTerrain(terrains[index])));  

                   } 
 },
                 subtitle: Container(
                     child: Card(
              elevation: 8.0,
              margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 6),
              child: Container(
                      padding: EdgeInsets.all(8),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Expanded (
                             flex: 4, 
                             child: CachedNetworkImage(
                               fit: BoxFit.cover,
                               height: 100,
                               width: 250,
                                imageUrl: terrains[index].urlPhotoTerrain,
                                errorWidget: (context, url, error) => Icon(Icons.error),
),
         
                             ),
                           Expanded(
                             flex: 8,
                               child: Container(
                                 
                                 padding: EdgeInsets.only(bottom: 8),
                                 child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                                  
                   Padding(padding: EdgeInsets.only(left: 8) ,child: Text(terrains[index].localiteTerrain,style:TextStyle(fontWeight: FontWeight.bold , fontSize: 16),
                    maxLines: 2,
                   overflow: TextOverflow.ellipsis,),),
                   Padding(padding: EdgeInsets.all( 8) ,
                     child: Row(
                       mainAxisSize:MainAxisSize.max ,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
 Text('\$' ,style: TextStyle(fontWeight: FontWeight.bold , color: Colors.orange , fontSize: 16),) ,                        Container(
                           margin: EdgeInsets.only(left: 8,),
                           child: Text('${terrains[index].prixTerrain} '),
                         )
                       ],
                     ),
                   ),
                   Padding(padding: EdgeInsets.all( 8) ,
                     child: Row(
                       mainAxisSize:MainAxisSize.max ,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Icon(Icons.landscape, color: Colors.orange, size: 16,),
                         Container(
                           margin: EdgeInsets.only(left: 8,),
                           child: Text('${terrains[index].surface} ${terrains[index].suffixeSurface}'),
                         )
                       ],
                     ),
                   )

                 ],
                                 ),
                               )
                           )
                         ],
                       ),
              ),

            ),
                   ),
                 
               ) ,
               
             Row(
           mainAxisAlignment:  MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Flexible(child: Row(
               children: [
                 Container(
                   margin: EdgeInsets.only(left: 8, right: 8),
                   ),
                 Container(
                   width: 8,
                   height: 8,
                   decoration: BoxDecoration(shape: BoxShape.circle , color: Colors.orange[900]),
                 ) ,
                 Expanded(
                   child: Divider(
                     color: Colors.orange[900],
                    
                   )
                   ),
                    Container(
                   width: 8,
                   height: 8,
                   decoration: BoxDecoration(shape: BoxShape.circle , color: Colors.orange[900]),
                 ) ,
               ],
             )
             )
           ],
              ),
             
            ],
          );

              }
          ):Center(child: CircularProgressIndicator()),
        
      ),
    );
  }
}