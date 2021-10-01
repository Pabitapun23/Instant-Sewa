import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/util/hexcode.dart';

class EmployeeCard extends StatefulWidget {
  @override
  _EmployeeCardState createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color _purple = HexColor('#603f8b');
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Id Card'),
        centerTitle: true,
        backgroundColor: _purple,
      ),
      body: Center(
        child: SizedBox(
          height: size.height * 0.45,
          child: Card(
            elevation: 5.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.07,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Instant Sewa Employee Id Card',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                  padding: EdgeInsets.only(top: 6.0),
                  decoration: BoxDecoration(
                    color: _purple,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 80.0,
                      child: ClipRRect(
                        child: SizedBox(
                          width: 150.0,
                          height: 150.0,
                          child: Image.asset(
                            "images/photos/provider.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Id',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'E-mail',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Contact',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('12345'),
                        SizedBox(
                          height: 2,
                        ),
                        Text('Ram Hamal'),
                        SizedBox(
                          height: 2,
                        ),
                        Text('ram@gmail.com'),
                        SizedBox(
                          height: 2,
                        ),
                        Text('9846034895'),
                      ],
                    )
                  ],
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.068,
                  decoration: BoxDecoration(
                    color: _purple,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
