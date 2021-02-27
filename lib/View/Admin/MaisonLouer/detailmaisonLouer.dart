import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sahelhabitat/Model/maisonLouer.dart';
import 'package:sahelhabitat/Provider/maisonLouer_provider.dart';
import 'package:sahelhabitat/View/Admin/MaisonLouer/editMaisonLouer.dart';
import 'package:sahelhabitat/View/Admin/SideBarNavigationAdmin/pages/louer.dart';

class DetailMaisonLouer extends StatefulWidget {
 final MaisonLouer maisonLouer;
 DetailMaisonLouer([this.maisonLouer]);
  @override
  _DetailMaisonLouerState createState() => _DetailMaisonLouerState();
}

class _DetailMaisonLouerState extends State<DetailMaisonLouer> {
   MaisonLouerProvider maisonLouerProvider = MaisonLouerProvider();
    
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
               imageUrl:widget.maisonLouer.urlPhotoMaisonLouer, 
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
                        _showMyDialog();
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
                     Navigator.of(context).push(MaterialPageRoute(builder: (contex) => EditeMaisonLouer(widget.maisonLouer)));
                     AlertDialog(
                       title: Text('aliou'),
                     );
                    },
                    
                  ),
                 

                  ],
                ),
                SizedBox(height:10),
                
               Card(
                 elevation: 5,
                //  shadowColor: Colors.orange,
        child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                 Text(
                  ('${widget.maisonLouer.paysMaisonLouer.toUpperCase()} , ${widget.maisonLouer.localiteMaisonLouer}'),
                   style: TextStyle(fontWeight: FontWeight.bold ,  ),
                  textAlign: TextAlign.center,
                ),
                 Icon(
                  Icons.home,
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
                    ('${widget.maisonLouer.prixMaisonLouer} ${widget.maisonLouer.deviceMaisonLouer}'),
                     style: TextStyle(fontWeight: FontWeight.bold),
                    
                  ),
                   Icon(
                  Icons.money_outlined,
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
                  // 
                  ('${widget.maisonLouer.surfaceMaisonLouer} ${widget.maisonLouer.suffixSurfaceMaisonLouer}'),
                   style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.landscape,
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
                 Text('Garage:'),
                 Text(
                  // 
                  ('${widget.maisonLouer.garageMaisonLouer}'),
                   style: TextStyle(fontWeight: FontWeight.bold),
                ),
              
               Text('Chambres:'),
                 Text(
                  // 
                  ('${widget.maisonLouer.nombreChambreMaisonLouer} '),
                   style: TextStyle(fontWeight: FontWeight.bold),
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
                
              
              //  Text('Chambres:'),
                 Text(
                  // 
                  ('${widget.maisonLouer.anneeConstructionMaisonLouer} '),
                   style: TextStyle(fontWeight: FontWeight.bold),
                ),
               Icon(
                  Icons.date_range,
                  color: Colors.orange,
                  
                ),  
              ],
            ),
      ),       
      SizedBox(height: 05,),
      ReadMoreText(
  'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
  trimLines: 2,
  colorClickableText: Colors.orange,
  trimMode: TrimMode.Line,
  trimCollapsedText: 'Show more',
  trimExpandedText: 'Show less',
  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold , color: Colors.orange),
),

              ]
              ),
            )
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
              Text('vous voulez supprimer cet agent :'),
              Text(widget.maisonLouer.localiteMaisonLouer),
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
              await maisonLouerProvider.removeMaisonLouer(widget.maisonLouer.idMaisonLouer);
             Navigator.of(context).push(MaterialPageRoute(builder: (contex) => LouerPage()));

              // Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  }
}