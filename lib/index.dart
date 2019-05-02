import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    return _IndexPage();
  }
}

const kExpandedHeight = 250.0;

class _IndexPage extends State<IndexPage> {
  ScrollController _scrollController;
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
  

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()..addListener(() => setState(() {}));
  }

  bool get _showTitle {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight;
  }

  showTopBG(){
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
          image: new AssetImage('assets/discovery_bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: new Text(
          '中国馆展览面积15000㎡，分为四大展区，包括中国生态文化展区、中国省区市园艺产业成就展区、中国园艺类高校及科研单位科研成果展区、中国非物质文化遗产插花艺术展区',
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
    return Scaffold(
      body: CustomScrollView(controller: _scrollController, slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          leading: Row(
            children: <Widget>[
              Text("北京"),
              Icon(Icons.arrow_drop_down),
            ],
          ),
          expandedHeight: kExpandedHeight,
          // title: _showTitle ? showForm() : null,
          title: showForm(),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.add),
              onPressed: () {},
            )
          ],
          flexibleSpace: _showTitle
              ? null
              : FlexibleSpaceBar(
                  title: new Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                    ],
                  ),
                  background: showTopBG()
                ),
        ),
        // Image.asset('assets/1.png',width: width,),
        SliverList(
          delegate: SliverChildListDelegate(List<Image>.generate(1, (int i) {
            return Image.asset('assets/1.png',width: width);
          })),
        ),
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
      ]),
    );
  }
}
