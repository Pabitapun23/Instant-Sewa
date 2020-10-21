import 'package:flutter/material.dart';
import 'package:instantsewa/model/Auth/log_in_form_model.dart';
import 'package:instantsewa/router/route_constants.dart';
import 'package:instantsewa/widgets/show_snackbar.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class LoginPage extends StatefulWidget {
  //LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: Injector(
          inject: [Inject<LogInFormModel>(() => LogInFormModel())],
          builder: (context) {
            final _singletonLogInFormModel = RM.get<LogInFormModel>();
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
                          observe: () => _singletonLogInFormModel,
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
                                    showSnackBar(
                                        key: _key,
                                        color: Colors.red,
                                        message:
                                            "Data is invalid,please fill before submitting the form");
                                  } else {
                                    _singletonLogInFormModel.setState(
                                        (signInFormState) async {
                                      await signInFormState.submitSignIn();
                                      Navigator.pushNamed(context, homeRoute);
                                    },
                                        onError: (context, error) =>
                                            showSnackBar(
                                                key: _key,
                                                color: Colors.red,
                                                message: "{$error.message}"));
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
