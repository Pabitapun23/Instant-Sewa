import 'package:flutter/material.dart';
import 'package:instantsewa/ui/user_image_page.dart';

class UserAddressPage extends StatefulWidget {
  @override
  _UserAddressPageState createState() => _UserAddressPageState();
}

class _UserAddressPageState extends State<UserAddressPage> {
  var address;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    bottom: 5,
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
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Enter your Address.",
                    style: TextStyle(
                      color: Color.fromRGBO(49, 39, 79, .6),
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                      ],
                    ),
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.place),
                              labelText: "Address",
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                            validator: (addressValue) {
                              if (addressValue.isEmpty) {
                                return 'Please Enter your Address';
                              }
                              address = addressValue;
                              return null;
                            },
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
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserImagePage()));
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        ),
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
