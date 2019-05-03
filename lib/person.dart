import 'package:flutter/material.dart';

class PersonManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Person();
  }
}

class Person extends State<PersonManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人中心'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.person_outline),
            Text("您尚未登录"),
            RaisedButton(
              elevation: 0,
              color: Colors.redAccent,
              textColor: Colors.white,
              child: Text(
                '登录',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    textBaseline: TextBaseline.alphabetic),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
