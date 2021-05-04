import 'package:flutter/material.dart';
class OptionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double width;

  const OptionButton({Key key, @required this.text, @required this.icon, @required this.width}) : super(key: key);
Widget addHorizontalSpace(double width){
  return SizedBox(
      width:width
  );
}
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      // ignore: deprecated_member_use
      child: FlatButton(
          color: Colors.blue,
          splashColor: Colors.white.withAlpha(55),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              addHorizontalSpace(10),
              Text(
                text,
                style: TextStyle(color: Colors.white),
              )
            ],
          )),
    );
  }
}
