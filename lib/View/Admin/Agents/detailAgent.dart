import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sahelhabitat/Model/agentModel.dart';
import 'package:sahelhabitat/View/Authentification/Inscription/Animation/FadeAnimation.dart';

class DetailAgent extends StatefulWidget {
   final AgentModel agentModel;
  DetailAgent([this.agentModel]);
  @override
  _DetailAgentState createState() => _DetailAgentState();
}

class _DetailAgentState extends State<DetailAgent> {
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
               imageUrl:widget.agentModel.urlPhotoAgant , 
                  fit: BoxFit.cover,),

              ),
            ),
               SliverFixedExtentList(
              itemExtent: 200.00,
              delegate: SliverChildListDelegate([
                Text('gsdgagsdfgsfg'),
                Text('gsdgagsdfgsfg'),
                Text('gsdgagsdfgsfg'),
                Text('gsdgagsdfgsfg'),
                Text('gsdgagsdfgsfg'),
                Text('gsdgagsdfgsfg'),
                Text('gsdgagsdfgsfg'),
                Text('gsdgagsdfgsfg'),
                Text('gsdgagsdfgsfg'),
                Text('gsdgagsdfgsfg'),
                Text('gsdgagsdfgsfg'),
                Text('gsdgagsdfgsfg'),
                Text('gsdgagsdfgsfg'),
                Text('gsdgagsdfgsfg'),
                Text('gsdgagsdfgsfg'),
                Text('gsdgagsdfgsfg'),
                Text('gsdgagsdfgsfg'),
                Text('gsdgagsdfgsfg'),
                Text('gsdgagsdfgsfg'),
                Text('gsdgagsdfgsfg'),

              ]
              ),
            )
          ],
        )
      ),
    
    );
  }
   Future<void> _showMyDialog(String phrase1 , String phrase2) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Alert error', style: TextStyle(fontWeight: FontWeight.bold , color: Colors.red[900]),),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(phrase1),
              Text(phrase2),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Approve'),
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