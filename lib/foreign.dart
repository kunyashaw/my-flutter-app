import 'package:flutter/material.dart';

class ForeignPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForeignPage();
  }
}

class _ForeignPage extends State<ForeignPage> {
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

  var newsList = [
    {"url":'assets/foreigners.jpg','title':'世界事务理事会西密歇根分会在大急流城举办中美建交40周年对话会，崔天凯大使同美国前副国务卿伯恩斯就中国发展、中美关系及两国经贸问题等进行对话交流'},
    {"url":'assets/foreigners_1.jpg','title':'2月6日晚，由中国驻美国大使馆和美国子午线国际中心共同举办的庆祝中美建交40周年暨2019新春招待会在中国驻美使馆举行。财政部助理部长塞耶、国务院代理亚太事务助卿墨菲等美国各界嘉宾约750人出席活动'},
    {"url":'assets/foreigners_2.jpg','title':'40年前，中国和美国建立外交关系。几乎是同一时期，中国开启了改革开放进程。过去40年里，两国和两国关系都实现了跨越式发展，为两国人民乃至世界各国人民带来巨大福利'},
    {"url":'assets/foreigners_3.jpg','title':'整场演出汇集了歌唱、舞蹈、京剧、中国器乐演奏及充满中国艺术和传统特色的节目。艺术家们以精湛的技艺、满腔的热情，为大华府地区侨胞和当地民众献上了一台文化盛宴'},
  ];

  showTopInfo(i) {
    var news = newsList[i];
    print(news);
    return new Container(
      constraints: new BoxConstraints.expand(
        height: 200.0,
      ),
      alignment: Alignment.bottomCenter,
      padding: new EdgeInsets.only(left: 16.0, bottom: 20.0, right: 16),
      decoration: new BoxDecoration(
        image: new DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.8), BlendMode.dstATop),
          image: new AssetImage(news['url']),
          fit: BoxFit.cover,
        ),
      ),
      child: new Text(
          news['title'],
          style: new TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          )),
    );
  }

  showCategories(context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.asset(
              'assets/category_4.jpg',
              width: width,
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Row(
            children: <Widget>[
              Text("北京"),
              Icon(Icons.arrow_drop_down),
            ],
          ),
          title: Form(
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
          ),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.add),
              onPressed: () {},
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            showTopInfo(0),
            showCategories(context),
            // Card(child: showTopInfo()),
            Expanded(child:ListView.builder(
              itemCount: 4,
              itemBuilder: (context,index)=>Card(child: showTopInfo(index)),
            ))
          ],
        ));
  }
}
