import 'package:flutter/material.dart';
import './products.dart';

class ProductManager extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager>{
final List<String> products=['123'];
 @override
  Widget build(BuildContext context) {
    return    
    Column(
        children:[
          Container(
                margin: EdgeInsets.all(10),
                child: RaisedButton(
                    child: Text("ClickMe"),
                    onPressed: () {
                      print("clicked");
                      setState(() {
                        products.add("test");
                      });
                    }),
              ),
          Products(products)
          ]
    );
  } 
}