import 'package:flutter/material.dart';
import 'package:instantsewa/ui/schedule_page.dart';
import 'package:instantsewa/util/hexcode.dart';

class AddressPage extends StatefulWidget {
  //AddressPage({Key key}) : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  Color _purple = HexColor('#603f8b');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Address Details'),
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
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Give us your address below.",
                    style: TextStyle(
                        color: Color.fromRGBO(49, 39, 79, .6), fontSize: 17.0),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
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
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[200]))),
                          child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.home),
                                  labelText: "Address",
                                  labelStyle: TextStyle(color: Colors.grey))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: SizedBox(
                      height: 45.0,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: RaisedButton(
                        color: _purple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SchedulePage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 12.0),
                          child: Text(
                            'Next',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17.0),
                          ),
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
