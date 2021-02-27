import 'package:flutter/material.dart';
import 'package:sahelhabitat/View/Admin/MaisonLouer/ajoutMaisonLouer.dart';
import 'package:sahelhabitat/View/Admin/SideBarNavigationAdmin/bloc.navigation_bloc/navigation_bloc.dart';

class LouerPage extends StatefulWidget with NavigationStates {
  @override
  _LouerPageState createState() => _LouerPageState();
}

class _LouerPageState extends State<LouerPage> {
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
      body: Container(
        color: Colors.white,
        child: Text('data'),
        ),
         floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(
            context,
          MaterialPageRoute(builder: (context) => AjoutMaisonLouer()),
     );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange[900],
        
      ),
    );
  }
}