import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:readmore/readmore.dart';
import 'package:sahelhabitat/Model/maisonLouer.dart';
import 'package:sahelhabitat/Provider/maisonLouer_provider.dart';
import 'package:sahelhabitat/View/SideBarNavigation/pages/test.dart';
import 'package:flutter/services.dart';

class DetailLouers extends StatefulWidget {
  final MaisonLouer maisonLouer;
 DetailLouers ([this.maisonLouer]);
  @override
  _DetailLouersState createState() => _DetailLouersState();
}

class _DetailLouersState extends State<DetailLouers> {

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
               SizedBox(
                height: 10,
               ),
                
               Card(
                 elevation: 5,
        child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                 Text(
                  ('${widget.maisonLouer.paysMaisonLouer.toUpperCase()} , ${widget.maisonLouer.localiteMaisonLouer}'),
                   style: TextStyle(fontWeight: FontWeight.bold ,  ),
                  textAlign: TextAlign.center,
                ),
                 Icon(
                  Icons.room,
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
                    ('${widget.maisonLouer.prixMaisonLouer} '),
                     style: TextStyle(fontWeight: FontWeight.bold),
                    
                  ),
               Text('\$' ,style: TextStyle(fontWeight: FontWeight.bold , color: Colors.orange , fontSize: 25),)
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
                if(Platform.isIOS)
                   Icon(
                  Icons.home,
                  color: Colors.orange,
                   )
                else
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
   
}