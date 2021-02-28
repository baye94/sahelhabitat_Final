
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:sahelhabitat/Provider/agent_provider.dart';
import 'package:sahelhabitat/Provider/maisonLouer_provider.dart';
import 'package:sahelhabitat/Provider/maison_provider.dart';
import 'package:sahelhabitat/Provider/terrain_provider.dart';
import 'package:sahelhabitat/Service/serviceFirebase.dart';
import 'package:sahelhabitat/View/splashScreen.dart';
import 'Service/serviceFirebase.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
String finalemail;
void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  }

class MyApp extends StatefulWidget  {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
// @override
//   void initState() {
    
//     getValideData().whenComplete(() async{
//       Timer(Duration(seconds: 2),() => Get.to(
//         finalemail ==null ? home2() :SideBarLayout()
//       ));
//     });
//     super.initState();
    
//   }
//   Future getValideData() async{
//   final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   var obtenirMail = sharedPreferences.getString('email');
//   setState(() {
//     finalemail =obtenirMail;
//   });
//   print('Email envoier est $finalemail');
// }
  @override
  Widget build(BuildContext context) {
    
   
    final servicefirestore = ServiceFirebase();
    return MultiProvider(
      providers: [
            ChangeNotifierProvider(create: (context) => AgentProvider()),
            StreamProvider(create: (context)=> servicefirestore.getAgents()),
            ChangeNotifierProvider(create: (context)=> TerrainProvider()),
            StreamProvider(create: (context) => servicefirestore.getTerrain()),
            ChangeNotifierProvider(create: (context) => MaisonVendreProvider()),
            StreamProvider(create: (context)=> servicefirestore.getMaisonVendre()),
            ChangeNotifierProvider(create: (context) => MaisonLouerProvider()),
            StreamProvider(create: (context) => servicefirestore.getMaisonLouer())
          ],
          child: MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
      home: MyHomePage(title: 'Flutter Page'),
          ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
 
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
     
          return GetMaterialApp ( 
           debugShowCheckedModeBanner: false,
           theme: ThemeData(
             scaffoldBackgroundColor: Colors.white,
             primaryColor: Colors.white,

           ),
           
           home:SplashScreen() ,
    );
   
  }
}
