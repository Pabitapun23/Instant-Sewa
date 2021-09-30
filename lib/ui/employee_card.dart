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
          height: size.height * 0.4,
          child: Card(
            elevation: 5.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [Container()],
            ),
          ),
        ),
      ),
    );
  }
}
