import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:readmore/readmore.dart';
import 'package:sahelhabitat/Model/maisonLouer.dart';
import 'package:sahelhabitat/Provider/maisonLouer_provider.dart';

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
          height: MediaQuery.of(context).size.height/1.9,
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
                  Icons.landscape,
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
             
                 Text(
                  // 
                  ('${widget.maisonLouer.nombreChambreMaisonLouer} '),
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
                  ('${widget.maisonLouer.nombreSalleBains}'),
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
                  ('${widget.maisonLouer.garageMaisonLouer}'),
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
     Card(
                 elevation: 5,
                //  shadowColor: Colors.orange,
        child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
              
              //  Text('Chambres:'),
                 Text(
                  // 
                  ('Paiement/${widget.maisonLouer.typeLouer} '),
                   style: TextStyle(fontWeight: FontWeight.bold),
                ),
               
              ],
            ),
      ), 
     FlatButton(
  onPressed: (){
    modal(widget.maisonLouer.description,widget.maisonLouer.urlPhotoMaisonLouer);
  }, 
  child: Text('Description',
  style: TextStyle(color: Colors.orange , fontWeight: FontWeight.normal),
  ))

              ]
              ),
            )
          ],
        )
      ),
    
    );
  }
   
}