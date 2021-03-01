import 'package:flutter/material.dart';
import 'package:sahelhabitat/View/SideBarNavigation/pages/borderIcon.dart';
import 'package:sahelhabitat/View/SideBarNavigation/pages/optionButton.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Widget addVerticalSpace(double height){
  return SizedBox(
    height:height
  );
}

Widget addHorizontalSpace(double width){
  return SizedBox(
      width:width
  );
}

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.asset('assets/back1.jpg'),
                        Positioned(
                          width: size.width,
                          top: padding,
                          child: Padding(
                            padding: sidePadding,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: BorderIcon(
                                    height: 50,
                                    width: 50,
                                    child: Icon(Icons.keyboard_backspace,color: Colors.orange,),
                                  ),
                                ),
                                BorderIcon(
                                  height: 50,
                                  width: 50,
                                  child: Icon(Icons.favorite_border,color: Colors.orange),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("2000000",style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30),),
                              addVerticalSpace(5),
                              Text("Mauritanie",style: themeData.textTheme.subtitle2,),
                            ],
                          ),
                          BorderIcon(child: Text("20 Hours ago",style: themeData.textTheme.headline5,),padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),)
                        ],
                      ),
                    ),
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Text("House Information",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w900),),
                    ),
                    addVerticalSpace(padding),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          InformationTile(content: "223",name: "Square Foot",),
                          InformationTile(content: "4",name: "Bedrooms",),
                          InformationTile(content: "345",name: "Bathrooms",),
                          InformationTile(content: "34",name: "Garage",),
                          InformationTile(content: "34",name: "Garage",),
                          InformationTile(content: "34",name: "Garage",),
                          InformationTile(content: "34",name: "Garage",),
                          InformationTile(content: "34",name: "Garage",),
                          InformationTile(content: "34",name: "Garage",),
                        ],
                      ),
                    ),
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Text("giureiuriuiwueyiuriwiiicvg igdiyfgagieguguoualkbcfeflbahgsjgfgksgdfkgsdkfgkgskdfksdfgsdbfkksdgkfgkbcqlweckgfghkbkalkfagkgksgdkfgkalvcfdhksgbckahxngkagcbdgshfgvsgdfgjgbdsgfdsgfgsdgfjksasuidfgiewgiutwiertgueiritegwitiieruwitiyityiuyiertyiewyrityieyruterutyerytwiktycgfkgsdkgfjhdhfghshhdhhddjhdhjfdhjhjhjhhhdfjhfdhfhjdhfdhjdfhjdfhjdfhjdfhjdhjdhjdfhfjdhjfdhjfdhfdfhjfdhjdfhjdfhjdffhjdfhjfdhjhjfhjfdhjfdhfdhjfdhjfdhjfdhdfhjdfhjfdhjfdhjhfdjhjdfhjhjfdhjfdhjfdhjhfjdhjfdhjfdhj"
                        ,textAlign: TextAlign.justify,style: TextStyle(fontWeight: FontWeight.w400),),
                    ),
                    addVerticalSpace(100),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OptionButton(text: "Message",icon: Icons.message,width: size.width*0.35,),
                    addHorizontalSpace(10),
                    OptionButton(text: "Call",icon: Icons.call,width: size.width*0.35,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InformationTile extends StatelessWidget{

  final String content;
  final String name;

  const InformationTile({Key key,@required this.content,@required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    final double tileSize = size.width*0.20;
    return Container(
      margin: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BorderIcon(
              width: tileSize,
              height: tileSize,
              
              child: Text(content,style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold))),
          // addVerticalSpace(15),
          SizedBox(
           height: 10,
          ),
          Text(name,style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold))
        ],
      ),
    );

  }
}