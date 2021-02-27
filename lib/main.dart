import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sahelhabitat/Provider/agent_provider.dart';
import 'package:sahelhabitat/Provider/maisonLouer_provider.dart';
import 'package:sahelhabitat/Provider/maison_provider.dart';
import 'package:sahelhabitat/Provider/terrain_provider.dart';
import 'package:sahelhabitat/Service/serviceFirebase.dart';
import 'Service/serviceFirebase.dart';
import 'View/Home/home2.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
   
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
    // setState(() {
    //   S.load(Locale(S.of(context).localeName, ''));
      
    // });
    
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white
      ),
      home: home2(),
      // home: SideBarLayout(),
    );
  }
}
