import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Instant Sewa"),
          backgroundColor: Colors.green,
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 30.8,
                        //color: Colors.brown,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),

              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email",
                    labelStyle: TextStyle(fontSize: 20),
                    filled: true),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Password",
                    labelStyle: TextStyle(fontSize: 20),
                    filled: true),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Forgot Password",
                style: TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  ButtonTheme(
                    height: 50,
                    disabledColor: Colors.green,
                    child: RaisedButton(
                      disabledElevation: 4.0,
                      onPressed: null,
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  Text("Don't have an account? Sign Up")
                ],
              )
            ],
          ),
        ));
  }
}
