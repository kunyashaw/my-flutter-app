import 'package:flutter/material.dart';

class DiscoveryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DiscoveryPage();
  }
}

class _DiscoveryPage extends State<DiscoveryPage> {
  List myList = [
    {"title": "专注", "index": 1},
    {"title": "远方", "index": 2},
    {"title": "世界", "index": 3},
    {"title": "美好", "index": 4},
    {"title": "爱", "index": 5},
    {"title": "浓郁", "index": 6},
    {"title": "需要", "index": 7},
    {"title": "好看", "index": 8},
    {"title": "开心", "index": 9},
    {"title": "正能量", "index": 10},
    {"title": "拥抱", "index": 11},
    {"title": "时代", "index": 12},
    {"title": "机遇", "index": 13},
    {"title": "知道", "index": 14},
  ];

  showTopBG() {
    return new Container(
      constraints: new BoxConstraints.expand(
        height: 200.0,
      ),
      alignment: Alignment.bottomCenter,
      padding: new EdgeInsets.only(left: 16.0, bottom: 20.0, right: 16),
      decoration: new BoxDecoration(
        image: new DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(1), BlendMode.dstATop),
          image: new AssetImage('assets/index_bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: new Text(
          '2019年中国北京世界园艺博览会（简称2019北京世园会或北京世园会），是经国际园艺生产者协会批准，由中国政府主办、北京市承办的最高级别的世界园艺博览会，是继云南昆明后第二个获得国际园艺生产者协会批准及国际展览局认证授权举办的A1级国际园艺博览会',
          style: new TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          )),
    );
  }

  showForm() {
    return Form(
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              new EdgeInsets.symmetric(vertical: 0, horizontal: 30.0),
          border: new OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none),
          hintText: '请输入关键词搜索',
          hintStyle: TextStyle(color: Colors.black12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List<Image> imgList = [Image.asset('assets/category_3.jpg', width: width)];

    return new Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          floating: false,
          expandedHeight: 250,
          leading: Row(
            children: <Widget>[
              Text("北京"),
              Icon(Icons.arrow_drop_down),
            ],
          ),
          title: showForm(),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.add),
              onPressed: () {},
            )
          ],
          flexibleSpace:
              FlexibleSpaceBar(title: Text(""), background: showTopBG()),
        ),
        SliverList(
          delegate: SliverChildListDelegate(imgList),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: SliverGrid.count(
              childAspectRatio: 0.4,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              children: myList
                  .map((e) => Column(
                        children: <Widget>[
                          Expanded(
                            child: Image.asset("assets/view_${e['index']}.jpg",
                                fit: BoxFit.cover),
                          ),
                          Text(e['title']),
                        ],
                      ))
                  .toList()),
        )
      ],
    ));
  }
}
