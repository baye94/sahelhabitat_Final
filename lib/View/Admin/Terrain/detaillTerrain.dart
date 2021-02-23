import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readmore/readmore.dart';
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
   Future<String> getData(bool shouldFail) async {
    await Future<void>.delayed(Duration(seconds: 3));
    if (shouldFail) {
      throw PlatformException(code: '404');
    }
    return 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?';
  }
 
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () async{
                        // _showMyDialog();
                         },
                       child: Icon(
                  Icons.delete,
                  color: Colors.orange,
                  ),
                    ),
                  GestureDetector(
                     child: Icon(
                    Icons.mode_edit,
                    color: Colors.orange,),
                    onTap: (){
                    //  Navigator.of(context).push(MaterialPageRoute(builder: (contex) => EditAgent(widget.agentModel)));
                     AlertDialog(
                       title: Text('aliou'),
                     );
                    
                    },
                     ),
                   ],
                ),
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
                  Icons.home_filled,
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
                    ('${widget.terrainModel.prixTerrain.toString()} ${widget.terrainModel.devicePrixTerrain.toString()}'),
                     style: TextStyle(fontWeight: FontWeight.bold),
                    
                  ),
                  Icon(
                  Icons.money,
                  color: Colors.orange,
                  
                ),
               
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
              _showMyDialogDescription();
            },
            child: Text('Description',
            style: TextStyle( fontWeight: FontWeight.bold,color: Colors.orange),
            ),
            ),    
      // SizedBox(height: 0,),
//       Container(
//         color:Colors.orange,
//         height: 3000,
//               child: ReadMoreText(
//   'Flutter is   dgf  dhdhd cghcghcghg  fxhgfgf ghfhghg jgfdfgdfghdf dfgdf shgdfgjs Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
//   textAlign: TextAlign.justify,
//   trimLines: 2,
//   colorClickableText: Colors.pink,
//   trimMode: TrimMode.Line,
//   trimCollapsedText: 'Show more',
//   trimExpandedText: 'Show less',
//   moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
// ),
//       )
            

              ]
              
              ),
               
            ),
           
          ],
        )
      ),
      
    );
  }
    Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      // return AlertDialog
      return CupertinoAlertDialog(
        title: Text('Alert', style: TextStyle(fontWeight: FontWeight.bold , color: Colors.red[900]),),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('vous voulez supprimer cet terrain :'),
              Text(widget.terrainModel.localiteTerrain),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('retour'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
           TextButton(
            child: Text('Approuver'),
            onPressed: ()  async{
              await terrainProvider.removeTerrain(widget.terrainModel.idTerrain);
            //  Navigator.of(context).push(MaterialPageRoute(builder: (contex) => MyAccountsPage()));

            //   Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
   }
    Future<void> _showMyDialogDescription() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      // return AlertDialog
      return CupertinoAlertDialog(
        title: Text('Description', style: TextStyle(fontWeight: FontWeight.bold , color: Colors.orange),),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
            
              Text(widget.terrainModel.descriptionTerrain),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('retour',),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
           
        ],
      );
    },
  );
   }
}