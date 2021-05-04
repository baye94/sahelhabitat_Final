import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sahelhabitat/Model/agentModel.dart';
// ignore: unused_import

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
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            // title: Text(widget.agentModel.nomCompletAgent),
            backgroundColor: Colors.white,
            actions: <Widget>[
              Image(
                image: AssetImage('assets/logo.png'),
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
                imageUrl: widget.agentModel.urlPhotoAgant,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.00,
            delegate: SliverChildListDelegate([
              SizedBox(height: 10),
              Card(
                elevation: 5,
                //  shadowColor: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      (widget.agentModel.nomCompletAgent.toUpperCase()),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.person,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 5,
                //  shadowColor: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      (widget.agentModel.telephoneAgent),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.phone,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 5,
                //  shadowColor: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      //
                      (widget.agentModel.emailAgent),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.email,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 5,
                //  shadowColor: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      (widget.agentModel.paysAgent),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.location_on,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 01,
              ),
              ReadMoreText(
                'Le rôle de ${widget.agentModel.nomCompletAgent} est d\'accompagner votre projet immobilier. Que vous souhaitiez acheter, vendre, mettre en location ou louer un logement.',
                style: TextStyle(color: Colors.black),
                trimLines: 2,
                colorClickableText: Colors.orange,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'plus',
                trimExpandedText: 'moins',
                moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
            ]),
          )
        ],
      )),
    );
  }
}
