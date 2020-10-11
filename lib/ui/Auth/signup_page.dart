import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instantsewa/ui/Auth/login_page.dart';
import 'package:instantsewa/util/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  //SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email;
  var username;
  var password;
  var cpassword;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 20,
                    left: 0,
                    child: Image.asset(
                      "images/main_top.png",
                      width: size.width * 0.40,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(49, 39, 79, 1),
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    //padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(196, 135, 198, .3),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          )
                        ]),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[200]))),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.person),
                                labelText: "Username",
                                labelStyle: TextStyle(color: Colors.grey),
                              ),
                              validator: (usernameValue) {
                                if (usernameValue.isEmpty) {
                                  return 'Please enter username';
                                }
                                username = usernameValue;
                                return null;
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[200]))),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.email),
                                labelText: "Email",
                                labelStyle: TextStyle(color: Colors.grey),
                              ),
                              validator: (emailValue) {
                                if (emailValue.isEmpty) {
                                  return 'Please enter email';
                                }
                                email = emailValue;
                                return null;
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[200]))),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.lock),
                                  labelText: "Password",
                                  labelStyle: TextStyle(color: Colors.grey)),
                              validator: (passwordValue) {
                                if (passwordValue.isEmpty) {
                                  return 'Please enter some text';
                                }
                                password = passwordValue;
                                return null;
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[200]))),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.lock),
                                labelText: "Confirm Password",
                                labelStyle: TextStyle(
                                  color: Color.fromRGBO(49, 39, 79, .6),
                                ),
                              ),
                              validator: (confirmpasswordValue) {
                                if (confirmpasswordValue.isEmpty) {
                                  return 'Please enter confirmpassword';
                                }
                                else{
                                  if (confirmpasswordValue != password) {
                                    return 'Password Not Matched';
                                  }
                                }
                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 80),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color.fromRGBO(49, 39, 79, 1),
                    ),
                    child: Center(
                      child: FlatButton(
                        child: Text(
                          _isLoading ? 'Proccessing...' : 'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: ()
                        {
                          if (_formKey.currentState.validate())
                            {
                              _register();
                            }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        "Already have an Account? SignIn",
                        style: TextStyle(color: Color.fromRGBO(49, 39, 79, .6)),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _register()async{
    setState(() {
      _isLoading = true;
    });
    var data = {
      'email' : email,
      'password': password,
      'username':username,
      'user_type':'serviceuser'
    };

    var res = await Network().authData(data, '/register');
    var body = json.decode(res.body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => LoginPage()
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }
}
