import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sahelhabitat/Model/agentModel.dart';
import 'package:sahelhabitat/Provider/agent_provider.dart';
import 'package:sahelhabitat/View/Admin/Agents/editAgent.dart';
import 'package:sahelhabitat/View/Admin/SideBarNavigationAdmin/pages/myaccountspage.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailAgent extends StatefulWidget {
   final AgentModel agentModel;
  DetailAgent([this.agentModel]);
  
  @override
  _DetailAgentState createState() => _DetailAgentState();
}

class _DetailAgentState extends State<DetailAgent> {
  AgentProvider agentProvider = AgentProvider();
  String url;
  Future<void> _launched;
  String _phone ;
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL() async {
  const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
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
                     Navigator.of(context).push(MaterialPageRoute(builder: (contex) => EditAgent(widget.agentModel)));
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
                  (widget.agentModel.nomCompletAgent),
                   style: TextStyle(fontWeight: FontWeight.bold , ),
                  
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
        child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                 RaisedButton(
          //          onPressed: () => {
          //          url = widget.agentModel.telephoneAgent ;
          //  if (await canLaunch()) {
          //     await launch(widget.agentModel.telephoneAgent);
          //   } else {
          //    throw 'Could not launch ${widget.agentModel.telephoneAgent}';
          //      }
          //          },
                onPressed: () =>  {
                _launched = _makePhoneCall('mailto:smith@example.org')
                },
                 child: Text(
                    (widget.agentModel.telephoneAgent),
                     style: TextStyle(fontWeight: FontWeight.bold),
                    
                  ),
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
        child:  Row(
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
        child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
               
                Text(
                  (widget.agentModel.paysAgent),
                  style: TextStyle(fontWeight: FontWeight.bold),
                  
                ),
                Icon(
                  Icons.home,
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
              Text(widget.agentModel.nomCompletAgent),
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
              await agentProvider.removeAgent(widget.agentModel.idAgent);
             Navigator.of(context).push(MaterialPageRoute(builder: (contex) => MyAccountsPage()));

              // Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
   }
  
}