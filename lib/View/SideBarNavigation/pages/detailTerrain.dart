import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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