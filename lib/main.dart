import 'package:flutter/material.dart';
import './index.dart';
import './list.dart';
import './detail.dart';
import './person.dart';

void main() => runApp(MyAppPage());

class MyAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyApp();
  }
}

class MyApp extends State<MyAppPage> {
  int _index = 0;
  final List<Widget> _children = [
    Center(child: IndexManager()),
    Center(child: ListManager()),
    Center(child: Detail(123)),
    PersonManager()
  ];

  onTabTapped(index) {
    setState(() {
      _index = index;
      print(_index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.redAccent, fontFamily: "Google Sans"),
        home: Scaffold(
            body: Center(child: _children.elementAt(_index)),
            bottomNavigationBar: SizedBox(
                height: 85,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    // sets the background color of the `BottomNavigationBar`
                    canvasColor: Colors.redAccent,
                  ),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    onTap: onTabTapped,
                    fixedColor: Colors.white,
                    currentIndex: _index,
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home,
                              color: Colors.white, size: _index == 0 ? 25 : 18),
                          title: new Text("首页",
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 14.0)),
                          backgroundColor: Colors.white),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.remove_red_eye,
                              color: Colors.white, size: _index == 1 ? 25 : 18),
                          title: Text('发现',
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 14.0)),
                          backgroundColor: Colors.white),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.language,
                              color: Colors.white, size: _index == 2 ? 25 : 18),
                          title: Text('涉外',
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 14.0)),
                          backgroundColor: Colors.white),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person,
                              color: Colors.white, size: _index == 3 ? 25 : 18),
                          title: Text('我的',
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 14.0)),
                          backgroundColor: Colors.white),
                    ],
                  ),
                ))));
  }
}
