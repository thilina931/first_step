import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myflutter/Pages/home.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>new _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage>{

  final formkey = new GlobalKey<FormState>();

  String _email;
  String _password;

  bool validateAndSave(){
    final form = formkey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    else{
      return false;
    }
  }
  void validateAndSubmit() async{
    if(validateAndSave()){
      try {
       FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)) as FirebaseUser;
       Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
      }
      catch (e){
        print('Error: $e');
      }
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
                onPressed: validateAndSubmit,
              )
            ],
          ),
        ),
      ),
    );
  }
  
}