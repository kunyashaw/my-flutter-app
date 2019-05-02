import 'package:flutter/material.dart';

class ForeignPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForeignPage();
  }
}

class _ForeignPage extends State<ForeignPage> {
  showTopInfo() {
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
          '30日下午，北京世园会新闻中心举行2019中国北京世界园艺博览会“北京日”活动新闻发布会，介绍各项活动筹备情况、特色亮点等相关信息',
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
              'assets/1.png',
              width: width,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Image.asset(
              'assets/2.png',
              width: width,
            ),
          ],
        )
      ],
    );
  }

  showGridView() {
    return Flexible(
      child:GridView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100, //子控件最大寬度爲100
        childAspectRatio: 0.5, //寬高比爲1:2
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      padding: EdgeInsets.all(10),
      children: List.generate(
        20,
        (index) {
          return Text("123");
        },
      ),
    ));
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
            showTopInfo(),
            showCategories(context),
            showGridView()
          ],
        ));
  }
}
