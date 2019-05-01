import 'package:flutter/material.dart';

class IndexManager extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {    
    return Index();
  }
}

class Index extends State<IndexManager>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
    );
  }
}