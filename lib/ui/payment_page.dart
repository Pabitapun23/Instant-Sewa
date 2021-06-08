import 'package:flutter/material.dart';
import 'package:instantsewa/util/hexcode.dart';

class PaymentPage extends StatefulWidget {
  //PaymentPage({Key key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color _purple = HexColor('#603f8b');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: _purple,
      ),
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
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Text(
                        "How do you want to pay?",
                        style: TextStyle(
                          color: Color.fromRGBO(49, 39, 79, .7),
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
//
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: SizedBox(
                          width: 225,
                          child: RaisedButton(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: EdgeInsets.only(
                                top: 4.0, bottom: 4.0, right: 40.0, left: 7.0),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: Colors.white,
                                  child: ClipRect(
                                    child: Image.asset(
                                      "images/photos/cash.png",
                                      height: 30.0,
                                      width: 30.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Cash",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            textColor: Colors.white,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 13.0,
                      ),
                      Center(
                        child: SizedBox(
                          width: 225,
                          child: RaisedButton(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: EdgeInsets.only(
                                top: 4.0, bottom: 4.0, right: 40.0, left: 7.0),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: Colors.white,
                                  child: ClipRect(
                                    child: Image.asset(
                                      "images/photos/paypal.png",
                                      height: 30.0,
                                      width: 30.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "PayPal",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            textColor: Colors.white,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 13.0,
                      ),
                      Center(
                        child: SizedBox(
                          width: 225,
                          child: RaisedButton(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: EdgeInsets.only(
                                top: 4.0, bottom: 4.0, right: 40.0, left: 7.0),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: Colors.white,
                                  child: ClipRect(
                                    child: Image.asset(
                                      "images/photos/khalti.png",
                                      height: 37.0,
                                      width: 37.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Khalti",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            textColor: Colors.white,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
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
