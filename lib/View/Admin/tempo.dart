import 'package:flutter/material.dart';
import 'package:sahelhabitat/View/Admin/MaisonVendre/ajoutMaisonVendre.dart';
import 'package:sahelhabitat/View/Admin/Terrain/ajoutTerrain.dart';

class Tempo extends StatefulWidget {
  @override
  _TempoState createState() => _TempoState();
}

class _TempoState extends State<Tempo> {
  @override
  Widget build(BuildContext context) {
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
      body: Center(
       
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
             height: MediaQuery.of(context).size.height/3,
            ),
           // ignore: deprecated_member_use
           RaisedButton(
             color: Colors.orange,
             onPressed: () { 
                  Navigator.push(
            context,
          MaterialPageRoute(builder: (context) => AjoutTerrain()),
     );
              },
             child:Text('Ajout Terrain'),

           ),
             // ignore: deprecated_member_use
             RaisedButton(
             color: Colors.orange,
             onPressed: () { 
                  Navigator.push(
            context,
          MaterialPageRoute(builder: (context) => AjoutMaisonVendre()),
     );
              },
             child:Text('Ajout Maison'),

           ),
         ],
         ),
      ),
      
    );
  }
}