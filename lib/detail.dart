import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  Detail(this.id);
  final int id;
  @override
  Widget build(BuildContext context) => new Scaffold(
    appBar: new AppBar(
      title: Text('详情页面'),
    ),
    body:Text('详情的id是$id')
  );
}