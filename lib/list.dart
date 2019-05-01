import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import './detail.dart';

class ListManager extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ListState();
  }
}


class ListState extends State<ListManager>{
  List list = [];

  getList() async{
    
    // 获取实例
    HttpClient myClient = new HttpClient();
    // 发起请求
    String url = "http://jsonplaceholder.typicode.com/users";
    HttpClientRequest request = await myClient.getUrl(Uri.parse(url));
    // 等待返回数据
    HttpClientResponse res =  await request.close();
    var result = await res.transform(utf8.decoder).join();
    list = jsonDecode(result);
    // 关闭请求
    myClient.close();
  }

  @override
  Widget build(BuildContext context) {
    getList();
    return Scaffold(
      appBar: AppBar(title: Text('列表页面'),),
      body: showList(context),
    );
  }

  showList(BuildContext context){
    return new ListView.builder(
    itemCount: list.length,
    itemBuilder: (BuildContext ctxt, int index) {
      var user = list[index];
      return Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              print('clicked');
              Navigator.push(context, new MaterialPageRoute(
              builder: (BuildContext context) => new Detail(user['id']),
            ));
 
              /* Navigator.push(
                context,
                new MaterialPageRoute(builder:(context)=>Detail(123))
              );*/
            },
            child: Text(
              user['name'],
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 20)
            ),
          )
        ]
      ); 
    });
  }
}