import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instantsewa/model/sign_up_form_model.dart';
import 'package:instantsewa/util/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignupPage extends StatefulWidget {
  //SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Injector(
        inject: [Inject<SignUpFormModel>(() => SignUpFormModel())],
        builder: (context) {
    final _singletonRegisterFormModel =
    Injector.getAsReactive<SignUpFormModel>();
    return SafeArea() ;
    }
      )
  );
}}
