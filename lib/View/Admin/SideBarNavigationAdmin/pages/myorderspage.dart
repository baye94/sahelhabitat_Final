import 'package:flutter/material.dart';
import 'package:sahelhabitat/View/Admin/Terrain/ajoutTerrain.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';

class MyOrdersPage extends StatefulWidget with NavigationStates {
  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
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
       floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(
            context,
          MaterialPageRoute(builder: (context) => AjoutTerrain()),
     );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange[900],
        
      ),
    );
  }
}
