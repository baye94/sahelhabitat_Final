// import 'dart:html';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:slimy_card/slimy_card.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
final List<Widget> imageSliders = imgList.map((item) => Container(
  child:   Card(
    child: Column(
      children: [
        Container(
          // color: Colors.blue,
          height: 160,
          width: 500,
          // child: ListTile(
          //   title: Text('1625 Main Street',
          //       style: TextStyle(fontWeight: FontWeight.w500)),
          //   subtitle: Text('My City, CA 99984'),
          //   leading: Icon(
          //     Icons.restaurant_menu,
          //     color: Colors.blue[500],
          //   ),
          // ),
          child: Image(
            image: AssetImage('assets/back2.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        ListTile(
          title: Text('Mbour',
              style: TextStyle(fontWeight: FontWeight.w500)),
          leading: Icon(
            Icons.location_city,
            color: Colors.orange,
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text('Terrain'),
            leading: Icon(
              // Icons.contact_mail,
              Icons.merge_type,
              color: Colors.orange,
            ),
          ),
        ),
      ],
    ),
  ),
),).toList();
class HomePage extends StatelessWidget with NavigationStates {
  CarouselController buttonCarouselController = CarouselController();
  final CarouselController _controller = CarouselController();
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30,),
              Text('AGENTS page administrateur' , style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              CarouselSlider(
                options: CarouselOptions(
                  height: 430.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,),
                // carouselController: buttonCarouselController,
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Column(
                        children: [
                          Card(
                            elevation: 10.9,
                            child: Column(

                              children: [

                               Container(
                                 height: 100,
                                 width: 100,
                                 child:Image(
                                    image: AssetImage('assets/fall.jpg'),
                                   fit: BoxFit.cover,
                                 ),
                                 decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius: BorderRadius.all(Radius.circular(5)),
                                     boxShadow: [
                                       BoxShadow(
                                         color:Colors.orange[600],

                                         offset: Offset(4.0,4.0),
                                         blurRadius: 0.0,
                                         spreadRadius: 0.0,
                                         // color: Colors.white.withOpacity(.7)
                                       ),
                                       BoxShadow(
                                         color:Colors.orange[600],
                                         offset: Offset(4.0,4.0),
                                         blurRadius: 0.0,
                                         spreadRadius: 0.0,
                                         // color: Colors.black.withOpacity(.15)

                                       ),
                                     ]
                                 ),
                               ),
                                ListTile(
                                  title: Text('Omar Ndiaye', textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500)),
                                  subtitle: Text('SENEGAL',textAlign: TextAlign.center),
                                  // leading: Icon(
                                  //   Icons.restaurant_menu,
                                  //   color: Colors.blue[500],
                                  // ),
                                ),
                                Divider(),
                                ListTile(
                                  title: Text('(221) 778935332',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500)),
                                  leading: Icon(
                                    Icons.contact_phone,
                                    color: Colors.orange[600],
                                  ),
                                ),
                                ListTile(
                                  title: Text('omar.ndiaye@sahelhabitat.com',textAlign: TextAlign.center),
                                  leading: Icon(
                                    Icons.contact_mail,
                                    color: Colors.orange[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RaisedButton(

                            onPressed: () =>
                                buttonCarouselController.nextPage(
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.linear),
                            child: Text('→'),
                            elevation: 5,
                          )
                        ],
                      );
                    },
                  );
                }).toList(),

              ),
              // SizedBox( height: 30),
            Center(
              child: Column(

                children:[ Card(
                  elevation: 10,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      print('Card tapped.');
                    },
                    child: Container(
                      width: 300,
                      height: 100,
                      child:Column(
                        children:[ RichText(

                          text: TextSpan(
                            text: ' ',
                            style: DefaultTextStyle.of(context).style,

                            children: <TextSpan>[
                              TextSpan(text: 'Looking to Buy a new property or Sell an existing one ?', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                              TextSpan(text: ' Sahel Habitat ',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange,fontSize: 20)),
                              TextSpan(text: ' provides an awesome solution !',style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20)),
                            ],
                          ),
                        ),

                        ]
                      ),

                    ),
                  ),
                ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text('About'),
                  ),
              ]
              ),
            ),

               SizedBox( height: 30),
              Text('For Sales', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              SizedBox(height: 30,),
              Column(
                children: <Widget>[
                  CarouselSlider(
                     items: imageSliders,

                    options: CarouselOptions(enlargeCenterPage: true, height: 300),
                    carouselController: _controller,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: RaisedButton(
                          onPressed: () => _controller.previousPage(),
                          child: Text('←'),
                        ),
                      ),
                      // Flexible(
                      //   child: RaisedButton(
                      //     onPressed: () => _controller.nextPage(),
                      //     child: Text('→'),
                      //   ),
                      // ),

                      Flexible(
                        child: RaisedButton(
                          onPressed: () => _controller.nextPage(),
                          child: Text('→'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            SizedBox(height: 30,),
              Text('SERVICES', style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 40,),

            ],
          ),
        ),
      ),
    );
  }



}

