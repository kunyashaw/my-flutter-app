import 'package:flutter/material.dart';
import './index.dart';
import './foreign.dart';
import './person.dart';
import './discovery.dart';

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
    Center(child: IndexPage(title: '123')),
    Center(child: DiscoveryPage()),
    Center(child: ForeignPage()),
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
                              color: Colors.white, size: _index == 0 ? 20 : 15),
                          title: new Text("首页",
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 14.0)),
                          backgroundColor: Colors.white),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.remove_red_eye,
                              color: Colors.white, size: _index == 1 ? 20 : 15),
                          title: Text('发现',
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 14.0)),
                          backgroundColor: Colors.white),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.language,
                              color: Colors.white, size: _index == 2 ? 20 : 15),
                          title: Text('涉外',
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 14.0)),
                          backgroundColor: Colors.white),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person,
                              color: Colors.white, size: _index == 3 ? 20 : 15),
                          title: Text('我的',
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 15.0)),
                          backgroundColor: Colors.white),
                    ],
                  ),
                ))));
  }
}
