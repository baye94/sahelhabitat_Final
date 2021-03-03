
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:sahelhabitat/View/Authentification/Inscription/inscription.dart';
import 'package:sahelhabitat/View/Home/style.dart';

// ignore: camel_case_types
class home2 extends StatefulWidget {
  @override
  _home2State createState() => _home2State();
}

// ignore: camel_case_types
class _home2State extends State<home2> {

  
   final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int page1 = 0;
  int _currentPage = 0;
  
  
  

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }
   Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.orange[900],
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Colors.orange[900],
                Colors.orange[800],
                Colors.orange[700],
                Colors.orange[500],
              ],
             
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    // onPressed: () => print('Skip'),
                    onPressed: () { 
                      print('Skip');
                        Navigator.push(
                                                 context,
                               MaterialPageRoute(builder: (context) => inscription()),
  );
                     },
                    child: Text(
                      'Sauter',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 600.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Container(
                                 child: Image(
                                       fit: BoxFit.contain,
                                  image: AssetImage(
                                    'assets/logo.png',
                                  ),
                                  height: 300.0,
                                  width: 300.0,
                                ),
                                decoration:BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Colors.white,
                               ),
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Acheter\n un terrain',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'L\'achat d\'un terrain est un investissement important. Il est donc nécessaire de se renseigner en détail sur ce bien et les procédures à suivre.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Container(
                                 child: Image(
                                       fit: BoxFit.contain,
                                  image: AssetImage(
                                    'assets/logo.png',
                                  ),
                                  height: 300.0,
                                  width: 300.0,
                                ),
                                decoration:BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Colors.white,
                               ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              'Construire une maison\n pour vous',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 10.0),
                            Expanded(
                              flex: 2,
                                     child: Text(
                                'Construire une maison est un engagement, un rêve de vie, d\'argent, de temps, d\'avenir. Sahel Habitat vous conseille à chaque étape clé de votre projet.',
                                style: kSubtitleStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                               child: Container(
                                 child: Image(
                                       fit: BoxFit.contain,
                                  image: AssetImage(
                                    'assets/logo.png',
                                  ),
                                  height: 300.0,
                                  width: 300.0,
                                ),
                                decoration:BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Colors.white,
                               ),
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Gestion locative\n de vos maisons',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Confier un mandat de gestion locative vous permet de déléguer tous les travaux de gestion locative à Sahel Habitat',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Suivant',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 100.0,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () => print('Commencer'),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: FlatButton (
                                 onPressed: () { 
                                   if(Platform.isIOS){
                                      Navigator.push(
                                                 context,
                               CupertinoPageRoute(builder: (context) => inscription()),
                                       );

                                   }else{
                                      Navigator.push(
                                                 context,
                               MaterialPageRoute(builder: (context) => inscription()),
                                       );
                                   }
                                  },
                                  child: Text(
                        'Commencer',
                        style: TextStyle(
                          // color: Color(0xFF5B16D0),
                          color: Colors.orange[900],
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
 
  
}