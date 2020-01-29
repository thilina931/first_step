import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myflutter/Pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum Formtype { login, register }

class _LoginPageState extends State<LoginPage> {
  final formkey = new GlobalKey<FormState>();

  String _email;
  String _password;
  Formtype _formtype = Formtype.login;

  bool validateAndSave() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        AuthResult result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        FirebaseUser user = result.user;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Home(
                      user: user,
                    )));
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  void moveToRegister() {
    setState(() {
      _formtype = Formtype.register;
    });
  }
void moveToLogin(){
  setState(() {
    _formtype = Formtype.login;
  });

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
            children: buildInput() + buildSubmitButtons(),
          ),
        ),
      ),
    );
  }

  List<Widget> buildInput() {
    return [
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Email'),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty..' : null,
        onSaved: (value) => _email = value,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: (value) =>
            value.isEmpty ? 'Password can\'t be empty..' : null,
        onSaved: (value) => _password = value,
      ),
    ];
  }
  List<Widget> buildSubmitButtons(){
    if (_formtype == Formtype.login ){
    return[
      new RaisedButton(
        child: new Text(
          'Login',
          style: new TextStyle(fontSize: 20.0),
        ),
        onPressed: validateAndSubmit,
      ),
      new FlatButton(
        child: new Text('Create an account.',
            style: new TextStyle(fontSize: 20.0)),
        onPressed: moveToRegister,
      ),
    ];
    }
    else{
      return[
        new RaisedButton(
          child: new Text(
            'Create an account',
            style: new TextStyle(fontSize: 20.0),
          ),
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
          child: new Text('Have an account.? Login',
              style: new TextStyle(fontSize: 20.0)),
          onPressed: moveToLogin,
        ),
      ];
    }
  }
}
