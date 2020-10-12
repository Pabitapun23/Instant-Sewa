import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instantsewa/router/route_constants.dart';
import 'package:instantsewa/ui/Auth/signup_page.dart';
import 'package:instantsewa/ui/cart_page.dart';
import 'package:instantsewa/ui/home_page.dart';
import 'package:instantsewa/ui/profile_page.dart';
import 'package:instantsewa/util/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../model/log_in_form_model.dart';
import '../../model/log_in_form_model.dart';
import '../../model/log_in_form_model.dart';

class LoginPage extends StatefulWidget {
  //LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: Injector(
          inject: [Inject<LogInFormModel>(() => LogInFormModel())],
          builder: (context) {
            final _singletonLogInFormModel =
                Injector.getAsReactive<LogInFormModel>();
            return SafeArea(
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 230,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          child: Image.asset(
                            "images/instant_sewa.png",
                            height: size.height * 0.35,
                          ),
                        ),
                        Positioned(
                          bottom: 150,
                          left: 0,
                          child: Image.asset(
                            "images/main_top.png",
                            width: size.width * 0.35,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Image.asset(
                            "images/login_bottom.png",
                            width: size.width * 0.29,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(49, 39, 79, 1),
                              fontSize: 30),
                        ),
                        SizedBox(
                          height: 15,
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                StateBuilder<LogInFormModel>(
                                  builder: (_, _singletonLogInFormModel) {
                                    return Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextFormField(
                                        onChanged: (String email) {
                                          _singletonLogInFormModel.setState(
                                              (state) => state.setEmail(email),
                                              catchError: true);
                                        },
                                        decoration: InputDecoration(
                                          errorText:
                                              _singletonLogInFormModel.hasError
                                                  ? _singletonLogInFormModel
                                                      .error.message
                                                  : null,
                                          border: InputBorder.none,
                                          prefixIcon: Icon(Icons.email),
                                          hintText: "Email",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                StateBuilder<LogInFormModel>(builder:
                                    (context, _singletonLogInFormModel) {
                                  return Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextFormField(
                                      onChanged: (String password) {
                                        _singletonLogInFormModel.setState(
                                            (state) =>
                                                state.setPassword(password),
                                            catchError: true);
                                      },
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        errorText:
                                            _singletonLogInFormModel.hasError
                                                ? _singletonLogInFormModel
                                                    .error.message
                                                : null,
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.lock),
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Forgot Password?",
                          style:
                              TextStyle(color: Color.fromRGBO(49, 39, 79, .6)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        StateBuilder(
                          models: [_singletonLogInFormModel],
                          builder: (_, model) {
                            return Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 80),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color.fromRGBO(49, 39, 79, 1),
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  if (!_singletonLogInFormModel.state
                                      .validateData()) {
                                    _key.currentState.showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text("Data is invalid"),
                                      ),
                                    );
                                  }
                                },
                                height: 55,
                                shape: StadiumBorder(),
                                color: Theme.of(context).primaryColor,
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17.0),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, signUpRoute);
                            },
                            child: Text(
                              "Create an Account",
                              style: TextStyle(
                                  color: Color.fromRGBO(49, 39, 79, .6)),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}