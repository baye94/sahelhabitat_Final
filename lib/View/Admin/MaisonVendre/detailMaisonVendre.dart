import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sahelhabitat/Model/maisonVendre.dart';
import 'package:sahelhabitat/Provider/maison_provider.dart';
import 'package:sahelhabitat/View/Admin/MaisonVendre/editMaisonVendre.dart';
import 'package:sahelhabitat/View/Admin/SideBarNavigationAdmin/pages/myorderspage.dart';

class DetailMaisonVendre extends StatefulWidget {
  //  final AgentModel agentModel;
  // DetailAgent([this.agentModel]);
  final MaisonVendre maisonVendre;
  DetailMaisonVendre ([this.maisonVendre]);
  @override
  _DetailMaisonVendreState createState() => _DetailMaisonVendreState();
}

class _DetailMaisonVendreState extends State<DetailMaisonVendre> {
  MaisonVendreProvider maisonVendreProvider = MaisonVendreProvider();
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
               imageUrl:widget.maisonVendre.urlPhotoMaisonVendre, 
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
                     Navigator.of(context).push(MaterialPageRoute(builder: (contex) => EditeMaisonVendre(widget.maisonVendre)));
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
                  ('${widget.maisonVendre.paysMaisonVendre.toUpperCase()} , ${widget.maisonVendre.localiteMaisonVendre}'),
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
                    ('${widget.maisonVendre.prixMaisonVendre} ${widget.maisonVendre.deviceMaisonVendre}'),
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
                  ('${widget.maisonVendre.surfaceMaisonVendre} ${widget.maisonVendre.suffixSurfaceMaisonVendre}'),
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
                  ('${widget.maisonVendre.garageMaisonVendre}'),
                   style: TextStyle(fontWeight: FontWeight.bold),
                ),
              
               Text('Chambres:'),
                 Text(
                  // 
                  ('${widget.maisonVendre.nombreChambreMaisonVendre} '),
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
                  ('${widget.maisonVendre.anneeConstructionMaisonVendre} '),
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
              Text(widget.maisonVendre.localiteMaisonVendre),
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
              await maisonVendreProvider.removeMaison(widget.maisonVendre.idMaisonVendre);
             Navigator.of(context).push(MaterialPageRoute(builder: (contex) => MyOrdersPageAdmin()));

              // Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  }
}