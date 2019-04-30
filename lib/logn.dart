import 'package:flutter/material.dart';
import './list.dart';

class LoginManager extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new Login();
  }
}

class Login extends State<LoginManager>{
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  String uname="";
  String upwd="";


  @override
  Widget build(BuildContext context) {
    print("123");
    return Column(children: <Widget>[
      Form(
        key:loginKey,
        child:Column(
         children: <Widget>[
           TextFormField(
             decoration: InputDecoration(
               labelText: '请输入用户名',
             ),
             onSaved: (name){
               print('当期那用户名为'+uname);
               this.uname = name;

             },
           ),
           TextFormField(
             decoration: InputDecoration(
               labelText: '请输入密码'
             ),
             onSaved: (upwd){
               this.upwd= upwd;
               print('当期密码为'+upwd);
             },
           ),
           RaisedButton(
             child: Text('登录'),
             onPressed: (){
               print('pressed uname is '+uname+"  upwd is "+upwd);
               loginKey.currentState.save();
               if(uname == "zhangsan" && upwd == "123455"){
                //  跳转
                 Navigator.push(
                  context,
                  new MaterialPageRoute(builder:(context)=>ListManager())
                 );
               }else{
                 showMyDialog(context,"登录失败");
               }
             },
           )
         ],
        ),
      )
    ],);    
  }
  
  
  void showMyDialog(BuildContext context,String msg) {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}