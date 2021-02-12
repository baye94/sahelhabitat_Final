import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
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
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          // title: new  Text("fall"),
          // leading:  Image.asset('assets/logo.png', height: 52.0,),
          actions: <Widget>[
            Image(image: AssetImage('assets/logo.png'),
              // fit: BoxFit.values(100,122),
              width: 100,
              height: 100,
            ),
          ]
      ),
      body:GroupedListView <dynamic ,String> (
           elements: _data,
        groupBy: (item) => item['numero'] ,
        groupSeparatorBuilder: (groupvalue) => Padding(padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment:  MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    child: Text(groupvalue,textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 14 ,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(shape: BoxShape.circle , color: Colors.orange),
                  ) ,
                  Expanded(child: Divider(color: Colors.orange,))
                ],
              )
              )
            ],
          ),
        ),
        itemBuilder: (context , item){
             return Card(
               elevation: 8.0,
               margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 6),
               child: Container(
                 padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded (
                        flex: 4  ,
                          child: ClipRect(child: Image(image: AssetImage(item['image']), fit: BoxFit.cover, ) ,
                     // borderRadius : BorderRadius.all(Radius.circular(4))
                          )),
                      Expanded(
                        flex: 8,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(left: 8) ,child: Text(item['prenom'] + ' '+item['nom'],style:TextStyle(fontWeight: FontWeight.bold , fontSize: 16),
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
                                        child: Text('${item['prenom']}'),
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
                                        child: Text('${item['Pays']}'),
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

             ) ;
        },
        groupComparator: (group1,group2) => group1.compareTo(group2),
        itemComparator: (item1,item2) => item1['numero'].compareTo(item2['numero']),
        useStickyGroupSeparators: true,
        floatingHeader: false,
        order: GroupedListOrder.ASC,

      )
    );
  }
}
