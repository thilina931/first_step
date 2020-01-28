import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>new _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage>{

  final formkey = new GlobalKey<FormState>();

  String _email;
  String _password;

  void validateAndSave(){
    final form = formkey.currentState;

    if(form.validate()){
      form.save();
      print('Form is Valid.. Email: $_email, password: $_password');
    }
    else{
      print('Form is Invalid..Email: $_email, password: $_password');
    }

  }

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Fluter login demo'),
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: formkey,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Email'),
                validator: (value) => value.isEmpty ?'Email can\'t be empty..':null,
                onSaved: (value) => _email = value,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) => value.isEmpty ?'Password can\'t be empty..':null,
                onSaved: (value) => _password = value,
              ),
              new RaisedButton(
                child: new Text('Login', style: new TextStyle(fontSize: 20.0),),
                onPressed: validateAndSave,
              )
            ],
          ),
        ),
      ),
    );
  }
  
}