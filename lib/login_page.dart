import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>new _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage>{

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Fluter login demo'),
      ),
      body: new Container(
        child: new Text('Hello world'),
      ),
    );
  }
  
}