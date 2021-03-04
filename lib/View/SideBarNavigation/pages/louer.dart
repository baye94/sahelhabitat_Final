import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sahelhabitat/Model/maisonLouer.dart';
import 'package:sahelhabitat/View/SideBarNavigation/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:sahelhabitat/View/SideBarNavigation/pages/detailLouer.dart';

class LouerU extends StatefulWidget with NavigationStates{
  @override
  _LouerUState createState() => _LouerUState();
}

class _LouerUState extends State<LouerU> {
  @override
   Widget build(BuildContext context) {
    final louer = Provider.of<List<MaisonLouer>>(context);
    Future<bool> _onBackPressed(){
 return showDialog(
   context: context,
   builder: (context) {
    if(Platform.isIOS){
       return
     CupertinoAlertDialog(
     title: Text('Vous voullez quitter l\application'),
     actions: [
       FlatButton(
         onPressed:()=>Navigator.pop(context , false), 
         child: Text('No')),
           FlatButton(
         onPressed:()=>Navigator.pop(context , true), 
         child: Text('Oui'))
     ],
   );
    }else{
       return
     AlertDialog(
     title: Text('Vous voullez quitter l\application'),
     actions: [
       FlatButton(
         onPressed:()=>Navigator.pop(context , false), 
         child: Text('No')),
           FlatButton(
         onPressed:()=>Navigator.pop(context , true), 
         child: Text('Oui'))
     ],
   );
    }
   
   }
   );

}
    return WillPopScope(
       onWillPop:_onBackPressed ,
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
       body:( louer!=null ) 
           ? ListView.builder(
              itemCount: louer.length,
              itemBuilder:(context,index){
                 return
          Column(
            children:<Widget> [
            
              ListTile(
                 onTap: (){
                   if(Platform.isIOS){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailLouers(louer[index])));              

                   }else{
                      Navigator.of(context).push(CupertinoPageRoute(builder: (context) => DetailLouers(louer[index])));              

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
                                imageUrl: louer[index].urlPhotoMaisonLouer,
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
                                  
                   Padding(padding: EdgeInsets.only(left: 8) ,child: Text(louer[index].localiteMaisonLouer,style:TextStyle(fontWeight: FontWeight.bold , fontSize: 16),
                    maxLines: 2,
                   overflow: TextOverflow.ellipsis,),),
                   Padding(padding: EdgeInsets.all( 8) ,
                     child: Row(
                       mainAxisSize:MainAxisSize.max ,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Text('\$' ,style: TextStyle(fontWeight: FontWeight.bold , color: Colors.orange , fontSize: 16),),
                         Container(
                           margin: EdgeInsets.only(left: 8,),
                           child: Text('${louer[index].prixMaisonLouer.toString()}'),
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
                           child: Text('${louer[index].surfaceMaisonLouer} ${louer[index].suffixSurfaceMaisonLouer}'),
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