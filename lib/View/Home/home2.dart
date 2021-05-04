
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sahelhabitat/View/Authentification/Inscription/inscription.dart';

// ignore: camel_case_types
class home2 extends StatefulWidget {
  @override
  _home2State createState() => _home2State();
}

// ignore: camel_case_types
class _home2State extends State<home2> {

   List<StepModel> list = StepModel.list;
  var _controller = PageController();
  var initialPage = 0;
  //  final int _numPages = 3;
  // final PageController _pageController = PageController(initialPage: 0);
  // int page1 = 0;
  // int _currentPage = 0;
  // List<Widget> _buildPageIndicator() {
  //   List<Widget> list = [];
  //   for (int i = 0; i < _numPages; i++) {
  //     list.add(i == _currentPage ? _indicator(true) : _indicator(false));
  //   }
  //   return list;
  // }
  //  Widget _indicator(bool isActive) {
  //   return AnimatedContainer(
  //     duration: Duration(milliseconds: 150),
  //     margin: EdgeInsets.symmetric(horizontal: 8.0),
  //     height: 8.0,
  //     width: isActive ? 24.0 : 16.0,
  //     decoration: BoxDecoration(
  //       color: isActive ? Colors.white : Colors.orange[900],
  //       borderRadius: BorderRadius.all(Radius.circular(12)),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
     _controller.addListener(() {
      setState(() {
        initialPage = _controller.page.round();
      });
    });

    return Scaffold(
      
      body: Column(
        children: <Widget>[
          _appBar(),
          _body(_controller),
          _indicator(),
        ],
      ),
    );
  }

  _appBar() {
    return Container(
      
      margin: EdgeInsets.only(top: 25),
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if (initialPage > 0)
                _controller.animateToPage(initialPage - 1,
                    duration: Duration(microseconds: 500),
                    curve: Curves.easeIn);
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.withAlpha(50),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
          // ignore: deprecated_member_use
          FlatButton(
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
            // onPressed: () {
            //   if (initialPage < list.length)
            //     _controller.animateToPage(list.length,
            //         duration: Duration(microseconds: 500),
            //         curve: Curves.easeInOut);
            // },
            child: Text(
              "Skip",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _body(PageController controller) {
    return Expanded(
      child: PageView.builder(
        controller: controller,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                index == 1
                    ? _displayText(list[index].text)
                    : _displayImage(list[index].id),
                SizedBox(
                  // height: 5,
                ),
                index == 1
                    ? _displayImage(list[index].id)
                    : _displayText(list[index].text),
              ],
            ),
          );
        },
      ),
    );
  }

  _indicator() {
    return Container(
      width: 90,
      height: 90,
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 90,
              height: 90,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.orange[800]),
                value: (initialPage + 1) / (list.length + 1),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                if (initialPage < list.length)
                  _controller.animateToPage(initialPage + 1,
                      duration: Duration(microseconds: 500),
                      curve: Curves.easeIn);
              },
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.orange[800],
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _displayText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 20,

      ),
      
      textAlign: TextAlign.justify,
    );
  }

  _displayImage(int path) {
    return Image.asset(
      "assets/logo.png",
      height: MediaQuery.of(context).size.height * .3,
    );
  }
  //   return Scaffold(
  //     body: Container(
  //        decoration: BoxDecoration(
  //         gradient: LinearGradient(
  //           // begin: Alignment.topCenter,
  //           // end: Alignment.bottomCenter,
  //           // stops: [0.1, 0.4, 0.7, 0.9],
  //           colors: [
  //             Colors.orange[900],
  //             Colors.orange[800],
  //             Colors.orange[700],
  //             Colors.orange[500],
  //           ],
           
  //         ),
  //       ),
  //       child: Padding(
  //         // padding: EdgeInsets.symmetric(vertical: 10.0),
  //         padding: EdgeInsets.all(5.0),
  //         child: Column(
  //           // verticalDirection: VerticalDirection.down,
  //            crossAxisAlignment: CrossAxisAlignment.stretch,
  //           mainAxisSize: MainAxisSize.max,
  //           children: <Widget>[
  //             Container(
  //               alignment: Alignment.centerRight,
  //               child: FlatButton(
  //                 // onPressed: () => print('Skip'),
  //                 onPressed: () {
  //                   print('Skip');
  //                     Navigator.push(
  //                            context,
  //                            MaterialPageRoute(builder: (context) => inscription()),
  // );
  //                  },
  //                 child: Text(
  //                   'Sauter',
  //                   style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 20.0,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ),
  //             ),

  //              Container(
  //                 height: 600.0,
  //                  child: PageView(
  //                  scrollDirection: Axis.horizontal,
  //                   physics: ClampingScrollPhysics(),
  //                   controller: _pageController,
  //                   onPageChanged: (int page) {
  //                     setState(() {
  //                       _currentPage = page;
  //                     });
  //                   },
  //                   children: <Widget>[
  //                     Padding(
  //                       padding: EdgeInsets.all(40.0),
  //                       child: SingleChildScrollView(
  //                                                   child: Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: <Widget>[
  //                             Center(
  //                               child: Container(
  //                                  child: Image(
  //                                        fit: BoxFit.contain,
  //                                   image: AssetImage(
  //                                     'assets/logo.png',
  //                                   ),
  //                                   height: 250.0,
  //                                   width: 250.0,
  //                                 ),
  //                                 decoration:BoxDecoration(
  //                                  shape: BoxShape.circle,
  //                                  color: Colors.white,
  //                                ),
  //                               ),
  //                             ),
  //                             SizedBox(height: 30.0),
  //                             Text(
  //                               'Acheter un terrain',
  //                               style: kTitleStyle,
  //                             ),
  //                             SizedBox(height: 0.0),
  //                             Text(
  //                               'L\'achat d\'un terrain est un investissement important. Il est donc nécessaire de se renseigner en détail sur ce bien et les procédures à suivre.',
  //                               style: kSubtitleStyle,
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                     Padding(
  //                       padding: EdgeInsets.all(0.0),
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: <Widget>[
  //                           Center(
  //                               child: Container(
  //                                  child: Image(
  //                                        fit: BoxFit.contain,
  //                                   image: AssetImage(
  //                                     'assets/logo.png',
  //                                   ),
  //                                   height: 250.0,
  //                                   width: 250.0,
  //                                 ),
  //                                 decoration:BoxDecoration(
  //                                  shape: BoxShape.circle,
  //                                  color: Colors.white,
  //                                ),
  //                               ),
  //                             ),
  //                           SizedBox(height: 20.0),
  //                           Text(
  //                             'Construire une maison\n pour vous',
  //                             style: kTitleStyle,
  //                           ),
  //                           SizedBox(height: 10.0),
  //                           Expanded(
                              
  //                                    child: Text(
  //                               'Construire une maison est un engagement, un rêve de vie, d\'argent, de temps, d\'avenir. Sahel Habitat vous conseille à chaque étape clé de votre projet.',
  //                               style: kSubtitleStyle,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     Padding(
  //                       padding: EdgeInsets.all(10.0),
  //                       child: Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: <Widget>[
  //                             Center(
  //                                child: Container(
  //                                  child: Image(
  //                                        fit: BoxFit.contain,
  //                                   image: AssetImage(
  //                                     'assets/logo.png',
  //                                   ),
  //                                   height: 250.0,
  //                                   width: 250.0,
  //                                 ),
  //                                 decoration:BoxDecoration(
  //                                  shape: BoxShape.circle,
  //                                  color: Colors.white,
  //                                ),
  //                               ),
  //                             ),
  //                             SizedBox(height: 0.0),
  //                             Text(
  //                               'Gestion locative\n de vos maisons',
  //                               style: kTitleStyle,
  //                             ),
  //                             SizedBox(height: 15.0),
  //                             Text(
  //                               'Confier un mandat de gestion locative vous permet de déléguer tous les travaux de gestion locative à Sahel Habitat',
  //                               style: kSubtitleStyle,
  //                             ),
                        
  //                           ],
  //                         ),
  //                     ),
  //                   ],
  //                 ),
  //               ),

  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: _buildPageIndicator(),
  //             ),
  //             _currentPage != _numPages - 1
  //                 ? Expanded(
  //                     child: Align(
  //                       alignment: FractionalOffset.bottomRight,
  //                       child: FlatButton(
  //                         onPressed: () {
  //                           _pageController.nextPage(
  //                             duration: Duration(milliseconds: 500),
  //                             curve: Curves.ease,
  //                           );
  //                         },
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           mainAxisSize: MainAxisSize.min,
  //                           children: <Widget>[
  //                             Text(
  //                               'Suivant',
  //                               style: TextStyle(
  //                                 color: Colors.white,
  //                                 fontSize: 22.0,
  //                                 fontWeight: FontWeight.bold
  //                               ),
  //                             ),
  //                             SizedBox(width: 10.0),
  //                             Icon(
  //                               Icons.arrow_forward,
  //                               color: Colors.white,
  //                               size: 30.0,
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   )
  //                 : Text(''),
  //           ],
  //         ),
  //       ),
  //     ),
  //     bottomSheet: _currentPage == _numPages - 1
  //         ? Container(
  //             height: 100.0,
  //             width: double.infinity,
  //             color: Colors.white,
  //             child: GestureDetector(
  //               onTap: () => print('Commencer'),
  //               child: Center(
  //                 child: Padding(
  //                   padding: EdgeInsets.only(bottom: 30.0),
  //                   child: FlatButton (
  //                                onPressed: () { 
  //                                  if(Platform.isIOS){
  //                                     Navigator.push(
  //                                                context,
  //                              CupertinoPageRoute(builder: (context) => inscription()),
  //                                      );

  //                                  }else{
  //                                     Navigator.push(
  //                                                context,
  //                              MaterialPageRoute(builder: (context) => inscription()),
  //                                      );
  //                                  }
  //                                 },
  //                                 child: Text(
  //                       'Commencer',
  //                       style: TextStyle(
  //                         // color: Color(0xFF5B16D0),
  //                         color: Colors.orange[900],
  //                         fontSize: 20.0,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           )
  //         : Text(''),
  //   );
  }
 
  
class StepModel {
  final int id;
  final String text;

  StepModel({this.id, this.text});

  static List<StepModel> list = [
    StepModel(
      id: 1,
      text: "L\'achat d\'un terrain est un investissement important. Il est donc nécessaire de se renseigner en détail sur ce bien et les procédures à suivre.",
    ),
    StepModel(
      id: 2,
      text:
          "Construire une maison est un engagement, un rêve de vie, d\'argent, de temps, d\'avenir. Sahel Habitat vous conseille à chaque étape clé de votre projet.",
    ),
    StepModel(
      id: 3,
      text: "Confier un mandat de gestion locative vous permet de déléguer tous les travaux de gestion locative à Sahel Habitat",
    ),
  ];
}