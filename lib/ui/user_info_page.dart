import 'package:flutter/material.dart';

class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  //bool _checked;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                      width: size.width * 0.50,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      "Give us your information for better user experience.",
                      style: TextStyle(color: Color.fromRGBO(49, 39, 79, .6)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
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
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey[200]))),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.person),
                                    labelText: "Full Name",
                                    labelStyle: TextStyle(color: Colors.grey))),
                          ),
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey[200]))),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.phone),
                                    labelText: "Phone Number",
                                    labelStyle: TextStyle(color: Colors.grey))),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.place),
                              labelText: "Address",
                              labelStyle: TextStyle(color: Colors.grey),),
                          ),
                          CheckboxListTile(
                            title: Text("Lamachaur"),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: false,
                            onChanged: (bool value) {
                              setState(() {
                                //_checked = value;
                              });
                            },
                            activeColor: Colors.green,
                            checkColor: Colors.grey,
                          ),
                          CheckboxListTile(
                            title: Text("Bagar"),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: false,
                            onChanged: (bool value) {
                              setState(() {
                                //_checked = value;
                              });
                            },
                            activeColor: Colors.green,
                            checkColor: Colors.grey,
                          ),
                          CheckboxListTile(
                            title: Text("Others"),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: false,
                            onChanged: (bool value) {
                              setState(() {
                                //_checked = value;
                              });
                            },
                            activeColor: Colors.green,
                            checkColor: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 80),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color.fromRGBO(49, 39, 79, 1),
                    ),
                    child: Center(
                      child: Text(
                        "Next",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
