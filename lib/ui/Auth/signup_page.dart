import 'package:flutter/material.dart';
import 'package:instantsewa/model/Auth/sign_up_form_model.dart';
import 'package:instantsewa/router/route_constants.dart';
import 'package:instantsewa/widgets/show_snackbar.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignupPage extends StatefulWidget {
  //SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: _key,
        backgroundColor: Colors.white,
        body: Injector(
            inject: [Inject<SignUpFormModel>(() => SignUpFormModel())],
            builder: (context) {
              final _singletonRegisterFormModel =
              RM.get<SignUpFormModel>();
              return SafeArea(
                child: ListView(
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
                              child: Column(
                                children: <Widget>[
                                  StateBuilder<SignUpFormModel>(
                                    builder: (_, _singletonRegisterFormModel) {
                                      return Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[200]))),
                                        child: TextFormField(
                                          onChanged: (String username) {
                                            _singletonRegisterFormModel
                                                .setState(
                                                    (state) => state
                                                    .setUsername(username),
                                                catchError: true);
                                          },
                                          decoration: InputDecoration(
                                            errorText:
                                            _singletonRegisterFormModel
                                                .hasError
                                                ? _singletonRegisterFormModel
                                                .error.message
                                                : null,
                                            border: InputBorder.none,
                                            prefixIcon: Icon(Icons.person),
                                            hintText: "Username",
                                            hintStyle:
                                            TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  StateBuilder<SignUpFormModel>(
                                    builder: (_, _singletonRegisterModel) {
                                      return Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[200]))),
                                        child: TextFormField(
                                          onChanged: (String email) {
                                            _singletonRegisterFormModel
                                                .setState(
                                                    (state) =>
                                                    state.setEmail(email),
                                                catchError: true);
                                          },
                                          decoration: InputDecoration(
                                            errorText:
                                            _singletonRegisterFormModel
                                                .hasError
                                                ? _singletonRegisterFormModel
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
                                  StateBuilder<SignUpFormModel>(builder:
                                      (context, _singletonRegisterFormModel) {
                                    return Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextFormField(
                                        onChanged: (String password) {
                                          _singletonRegisterFormModel.setState(
                                                  (state) =>
                                                  state.setPassword(password),
                                              catchError: true);
                                        },
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          errorText: _singletonRegisterFormModel
                                              .hasError
                                              ? _singletonRegisterFormModel
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
                                  StateBuilder<SignUpFormModel>(builder:
                                      (context, _singletonRegisterFormModel) {
                                    return Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextFormField(
                                        onChanged: (String passwordConfirmation) {
                                          _singletonRegisterFormModel.setState(
                                                  (state) =>
                                                  state.setPasswordConfirmation(passwordConfirmation),
                                              catchError: true);
                                        },
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          errorText: _singletonRegisterFormModel
                                              .hasError
                                              ? _singletonRegisterFormModel
                                              .error.message
                                              : null,
                                          border: InputBorder.none,
                                          prefixIcon: Icon(Icons.lock),
                                          hintText: "Confirm Password",
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
                            height: 20,
                          ),
                          StateBuilder(
                            observe:()=> _singletonRegisterFormModel,
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
                                    if (!_singletonRegisterFormModel.state
                                        .validateData()) {
                                      showSnackBar(key: _key,color: Colors.red ,message:"Data is invalid,please fill before submitting the form");
                                    } else {
                                      _singletonRegisterFormModel.setState(
                                              (signInFormState) =>
                                              signInFormState.submitSignUp());
                                      Navigator.pushNamed(context, loginRoute);

                                    }
                                  },
                                  height: 55,
                                  shape: StadiumBorder(),
                                  color: Theme.of(context).primaryColor,
                                  child: Center(
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17.0),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pushNamed(context, loginRoute);
                              },
                              child: Text(
                                "Already have an account? Login",
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
            }));
  }
}
