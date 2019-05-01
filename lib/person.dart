import 'package:flutter/material.dart';

class PersonManager extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {    
    return Person();
  }
}

class Person extends State<PersonManager>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人中心'),
      ),
    );
  }
}