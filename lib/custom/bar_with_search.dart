import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 66.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      padding: new EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      child: new Center(
        child: new Text(title,
            style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 36.0)),
                
      ),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [
               Color(0xFF3383FC),
               Color(0xFF00C6FF)
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.5, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
    );
  }
}
