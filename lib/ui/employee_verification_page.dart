import 'package:flutter/material.dart';
import 'package:instantsewa/router/route_constants.dart';
import 'package:instantsewa/ui/employee_card.dart';
import 'package:instantsewa/util/hexcode.dart';

class EmployeeVerification extends StatefulWidget {
  @override
  _EmployeeVerificationState createState() => _EmployeeVerificationState();
}

class _EmployeeVerificationState extends State<EmployeeVerification> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  String dropdownValue = null;
  @override
  Widget build(BuildContext context) {
    Color _purple = HexColor('#603f8b');
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Verification'),
        backgroundColor: _purple,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, homeRoute);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Employee Id',
                    labelStyle: TextStyle(
                        color: _purple,
                        fontWeight: FontWeight.w500,
                        fontSize: 17.0),
                    hintText: 'id number'),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Employee email',
                    labelStyle: TextStyle(
                        color: _purple,
                        fontWeight: FontWeight.w500,
                        fontSize: 17.0),
                    hintText: 'email address'),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        'Choose Categories',
                        style: TextStyle(
                            color: _purple,
                            fontWeight: FontWeight.w500,
                            fontSize: 17.0),
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {/*code lekhna cha*/},
                        items: <String>['Male', 'Female']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => EmployeeCard(),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  color: _purple,
                  padding: EdgeInsets.fromLTRB(35, 12, 35, 12),
                  child: Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
