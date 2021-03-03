import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sahelhabitat/Model/maisonVendre.dart';
import 'package:sahelhabitat/Provider/maison_provider.dart';

class DetailVendre extends StatefulWidget {
  final MaisonVendre maisonVendre;
  DetailVendre ([this.maisonVendre]);
  @override
  _DetailVendreState createState() => _DetailVendreState();
}

class _DetailVendreState extends State<DetailVendre> {
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
                  Text(
                  // 
                  ('${widget.maisonVendre.garageMaisonVendre}'),
                   style: TextStyle(fontWeight: FontWeight.bold),
                ),
              Icon(
                Icons.airport_shuttle_outlined,
                color: Colors.orange,) 
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
                  ('${widget.maisonVendre.nombreChambreMaisonVendre} '),
                   style: TextStyle(fontWeight: FontWeight.bold),
                ),
              //    Image(image: AssetImage('assets/chambre23.png'),
              // color: Colors.black,
              // height: 30,
              // ),
              Icon(
                  Icons.king_bed_outlined,
                  color: Colors.orange,
                  size: 30,
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
                  (' salle de bains '),
                   style: TextStyle(fontWeight: FontWeight.bold),
                ),
                 Image(image: AssetImage('assets/bain.png'),
              color: Colors.orange,
              height: 30,
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
   
}