
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahelhabitat/Model/agentModel.dart';
import 'package:sahelhabitat/View/Admin/ajoutAgents.dart';
import 'package:sahelhabitat/View/Admin/editAgent.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
List   _data =[
  {
    'id':1,
    'nom': 'Diop',
    'prenom': 'fallou',
    'Pays':'Senegal',
    'numero': '778012345',
    'email': 'fallou@sahelhabitat.com',
    'image': 'assets/fall.jpg'
  },
  {
    'id':2,
    'nom': 'Diouf',
    'prenom': 'birame',
    'Pays':'Senegal',
    'numero': '777777777',
    'email': 'fallou@sahelhabitat.com',
    'image': 'assets/back1.jpg'
  },
  {
    'id':3,
    'nom': 'Diouf',
    'prenom': 'fallilou',
    'Pays':'belgique',
    'numero': '778934567',
    'email': 'fallilou@sahelhabitat.com',
    'image': 'assets/back2.jpg'
  },
  {
    'id':4,
    'nom': 'fall',
    'prenom': 'cheikh',
    'Pays':'canada',
    'numero': '7789345676',
    'email': 'cheikh@sahelhabitat.com',
    'image': 'assets/back3.jpg'
  },
  {
    'id':5,
    'nom': 'fall',
    'prenom': 'cheikh',
    'Pays':'canada',
    'numero': '778934562',
    'email': 'cheikh@sahelhabitat.com',
    'image': 'assets/back2.jpg'
  },
  {
    'id':6,
    'nom': 'fall',
    'prenom': 'cheikh',
    'Pays':'cana',
    'numero': '778934',
    'email': 'cheikh@sahelhabitat.com',
    'image': 'assets/back1.jpg'
  },
  {
    'id':7,
    'nom': 'fall',
    'prenom': 'cheikh',
    'Pays':'canada',
    'numero': '77892324',
    'email': 'cheikh@sahelhabitat.com',
    'image': 'assets/back3.jpg'
  },

];
class MyAccountsPage extends StatefulWidget with NavigationStates {
  
  @override
  _MyAccountsPageState createState() => _MyAccountsPageState();
}

class _MyAccountsPageState extends State<MyAccountsPage> {
  
  @override
  Widget build(BuildContext context) {
    final agents = Provider.of<List<AgentModel>>(context);
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
      body:( agents !=null) 
      
        ? ListView.builder(
          itemCount: agents.length,
          itemBuilder:(context,index){
            return
           Column(
             children:<Widget> [
               ListTile(
                  onTap: (){
                    print(agents[index].nomCompletAgent.toUpperCase());
                    print(agents[index].idAgent);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditAgent(agents[index])));
                  },
                  title: Text(agents[index].nomCompletAgent.toUpperCase()),
                  subtitle: Container(
                    child: Card(
               elevation: 8.0,
               margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 6),
               child: Container(
                     padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded (
                            flex: 4, 
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              height: 100,
                              width: 250,
                               imageUrl: agents[index].urlPhotoAgant,
                               errorWidget: (context, url, error) => Icon(Icons.error),
),
       
                            ),
                          Expanded(
                            flex: 8,
                              child: Container(
                                
                                padding: EdgeInsets.only(bottom: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                 
                                    Padding(padding: EdgeInsets.only(left: 8) ,child: Text(agents[index].nomCompletAgent,style:TextStyle(fontWeight: FontWeight.bold , fontSize: 16),
                                     maxLines: 2,
                                    overflow: TextOverflow.ellipsis,),),
                                    Padding(padding: EdgeInsets.all( 8) ,
                                      child: Row(
                                        mainAxisSize:MainAxisSize.max ,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.account_circle_sharp , color: Colors.orange, size: 16,),
                                          Container(
                                            margin: EdgeInsets.only(left: 8,),
                                            child: Text('${agents[index].telephoneAgent}'),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all( 8) ,
                                      child: Row(
                                        mainAxisSize:MainAxisSize.max ,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.calendar_today  , color: Colors.orange, size: 16,),
                                          Container(
                                            margin: EdgeInsets.only(left: 8,),
                                            child: Text('${agents[index].paysAgent}'),
                                          )
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              )
                          )
                        ],
                      ),
               ),

             ),
                  ),
                ) ,
              Row(
            mainAxisAlignment:  MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(shape: BoxShape.circle , color: Colors.orange[900]),
                  ) ,
                  Expanded(
                    child: Divider(
                      color: Colors.orange[900],
                     
                    )
                    ),
                     Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(shape: BoxShape.circle , color: Colors.orange[900]),
                  ) ,
                ],
              )
              )
            ],
          ),
             ],
           );

          }
           ): Center(child: CircularProgressIndicator()),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(
            context,
          MaterialPageRoute(builder: (context) => ajoutAgents()),
     );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange[900],
        
      ),
    );
  }
}

