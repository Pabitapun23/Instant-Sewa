import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulePage extends StatefulWidget {
  //SchedulePage({Key key}) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  CalendarController _controller;
  DateTime _dateTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select your schedule",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey.shade200,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Select the service date",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(49, 39, 79, 1),
                    fontSize: 20),
              ),
              SizedBox(
                height: 15.0,
              ),
              TableCalendar(
                initialCalendarFormat: CalendarFormat.week,
                calendarStyle: CalendarStyle(
                  todayColor: Colors.purple,
                  selectedColor: Colors.grey,
                  todayStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                headerStyle: HeaderStyle(
                  centerHeaderTitle: true,
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  formatButtonTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                  formatButtonShowsNext: false,
                ),
                calendarController: _controller,
              ),
              Text(_dateTime == null
                  ? 'Nothing has been picked yet'
                  : _dateTime.toString()),
              RaisedButton(
                child: Text('Select the service date'),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2080),
                  ).then((date) {
                    setState(() {
                      _dateTime = date;
                    });
                  });
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Select the service time",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(49, 39, 79, 1),
                    fontSize: 20),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  OutlineButton(
                    child: Text("10:00AM - 11:00AM"),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  OutlineButton(
                    child: Text("11:00AM - 12:00PM"),
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  OutlineButton(
                    child: Text("12:00PM - 01:00PM"),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  OutlineButton(
                    child: Text("01:00PM - 02:00PM"),
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  OutlineButton(
                    child: Text("02:00PM - 03:00PM"),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  OutlineButton(
                    child: Text("03:00PM - 04:00PM"),
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  OutlineButton(
                    child: Text("04:00PM - 05:00PM"),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  OutlineButton(
                    child: Text("05:00PM - 06:00PM"),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}