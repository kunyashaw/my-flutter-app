import 'package:flutter/material.dart';

class DiscoveryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DiscoveryPage();
  }
}

class _DiscoveryPage extends State<DiscoveryPage> {
  List myList = [
    {"title": "厦门", "index": 1},
    {"title": "上海", "index": 2},
    {"title": "广州", "index": 3},
    {"title": "西安", "index": 4},
    {"title": "南京", "index": 5},
    {"title": "深圳", "index": 6},
    {"title": "北京", "index": 7},
    {"title": "郑州", "index": 8},
    {"title": "天津", "index": 9},
  ];

  showGridView() {
    return CustomScrollView(
      shrinkWrap: true,
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: SliverGrid.count(
              childAspectRatio: 0.5,
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
              children: myList
                  .map((e) => Column(
                        children: <Widget>[
                          Expanded(
                            child: Image.asset("assets/building_${e['index']}.jpg",fit: BoxFit.cover),
                          ),
                          Text(e['title']),
                        ],
                      ))
                  .toList()),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('random dynamic tile sizes'),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[showGridView()]),
        ));
  }
}
