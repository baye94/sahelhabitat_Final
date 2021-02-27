import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sahelhabitat/Model/terrainModel.dart';
import 'package:sahelhabitat/View/Admin/SideBarNavigationAdmin/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:sahelhabitat/View/Admin/Terrain/detaillTerrain.dart';

import '../../tempo.dart';

class Terrains extends StatefulWidget with NavigationStates {
  @override
  _TerrainsState createState() => _TerrainsState();
}

class _TerrainsState extends State<Terrains> {
  @override
  Widget build(BuildContext context) {
   final terrains = Provider.of<List<TerrainModel>>(context);
 
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
        body:( terrains !=null ) 
         ? ListView.builder(
            itemCount: terrains.length,
            itemBuilder:(context,index){
         return
        Column(
          children:<Widget> [
            ListTile(
               onTap: (){
                 print('Avant la modification des donnees');
                 print(terrains[index].localiteTerrain.toUpperCase());
                 print(terrains[index].urlPhotoTerrain);
               
                   // Navigator.of(context).push(MaterialPageRoute(
                   //     builder: (context) => EditAgent(agents[index])));
 Navigator.of(context).push(MaterialPageRoute(builder: (context) =>DetailTerrain(terrains[index])));                  },
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
                       Icon(Icons.money , color: Colors.orange, size: 16,),
                       Container(
                         margin: EdgeInsets.only(left: 8,),
                         child: Text('${terrains[index].prixTerrain} ${terrains[index].devicePrixTerrain}'),
                       )
                     ],
                   ),
                 ),
                 Padding(padding: EdgeInsets.all( 8) ,
                   child: Row(
                     mainAxisSize:MainAxisSize.max ,
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Icon(Icons.space_bar_outlined, color: Colors.orange, size: 16,),
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
       floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(
            context,
          MaterialPageRoute(builder: (context) => Tempo()),
     );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange[900],
        
      ),
    );
  }
}