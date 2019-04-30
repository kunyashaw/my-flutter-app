import 'package:flutter/material.dart';
import './logn.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:Scaffold(
      appBar: AppBar(title:Text('main')),
      body: Container(
        child: Column(
          children: <Widget>[
            LoginManager()
          ],
        ),
      ),
    ));
  }
}