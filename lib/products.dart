import 'package:flutter/material.dart';

class Products extends StatelessWidget{
  final List<String> products;
  // 构造函数
  Products(this.products);

  @override
  Widget build(BuildContext context) {
    return     Column(
                  children: products
                      .map((e) => Card(
                              child: Column(
                                children: [
                                  Image.asset("assets/test.jpg"),
                                  Text('hello')
                                  ]
                                )
                              )
                          ).toList()
            );
            
  }
}