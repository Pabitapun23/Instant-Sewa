import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/model/service_user_date_and_time_model.dart';
import 'package:instantsewa/ui/service_provider_selection.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:intl/intl.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class SchedulePage extends StatefulWidget {
  String serviceId;
  double latitude, longitude;

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  double _height;
  double _width;
  String _setTime, _setDate;
  String _hour, _minute, _time;
  String dateTime;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _timeController2 = TextEditingController();
  CalendarController _controller;

  Color _purple = HexColor('#603f8b');

  MaterialColor _buttonColor = MaterialColor(0xFF603f8b, <int, Color>{
    50: Color(0xFF603f8b),
    100: Color(0xFF603f8b),
    200: Color(0xFF603f8b),
    300: Color(0xFF603f8b),
    400: Color(0xFF603f8b),
    500: Color(0xFF603f8b),
    600: Color(0xFF603f8b),
    700: Color(0xFF603f8b),
    800: Color(0xFF603f8b),
    900: Color(0xFF603f8b),
  });

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData(
                primaryColor: Color(0xFF603f8b),
                accentColor: Color(0xFF603f8b),
                primarySwatch: _buttonColor),
            child: child,
          );
        });
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2020, 11, 10, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  Future<Null> _selectTime2(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData(
                primaryColor: Color(0xFF603f8b),
                accentColor: Color(0xFF603f8b),
                primarySwatch: _buttonColor),
            child: child,
          );
        });
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController2.text = _time;
        _timeController2.text = formatDate(
            DateTime(2020, 11, 10, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2020, 11, 11, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    _timeController2.text = formatDate(
        DateTime(2020, 11, 11, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(
          "Select Your Schedule",
        ),
        backgroundColor: _purple,
      ),
      body: Injector(
        inject: [
          Inject<ServiceUserDateAndTimeModel>(
              () => ServiceUserDateAndTimeModel())
        ],
        builder: (context) {
          final _updateDateTimeModel = RM.get<ServiceUserDateAndTimeModel>();
          return SingleChildScrollView(
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
                        fontSize: 23),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  StateBuilder<ServiceUserDateAndTimeModel>(
                      builder: (context, _updateDateTimeModel) {
                    return InkWell(
                      onTap: () async {
                        //_selectDate(context, _updateDateTimeModel);
                        final DateTime picked = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            builder: (BuildContext context, Widget child) {
                              return Theme(
                                data: ThemeData(
                                    primaryColor: Color(0xFF603f8b),
                                    accentColor: Color(0xFF603f8b),
                                    primarySwatch: _buttonColor),
                                child: child,
                              );
                            },
                            initialDatePickerMode: DatePickerMode.day,
                            firstDate: DateTime(DateTime.now().year - 1),
                            lastDate: DateTime(DateTime.now().year + 2));
                        if (picked != null)
                          setState(() {
                            selectedDate = picked;
                            _dateController.text =
                                DateFormat.yMd().format(selectedDate);
                            _updateDateTimeModel
                              ..setState((state) =>
                                  state.setDate(_dateController.text));
                          });
                      },
                      child: Container(
                        width: _width / 2,
                        height: _height / 13,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: TextFormField(
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                          onSaved: (String val) {
                            _setTime = '21/02/2021';
//                            _updateDateTimeModel
//                                .setState((state) => state.setDate(val));
                          },
                          enabled: false,
                          keyboardType: TextInputType.text,
                          controller: _dateController,
                          decoration: InputDecoration(
                              disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              contentPadding: EdgeInsets.all(5)),
                        ),
                      ),
                    );
                  }),
                  SizedBox(
                    height: _height / 13,
                  ),
                  Text(
                    "Select the service time",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(49, 39, 79, 1),
                        fontSize: 23),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Start Time:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _selectTime(context);
                        },
                        child: Container(
                          width: _width / 2,
                          height: _height / 13,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Colors.grey[200]),
                          child: TextFormField(
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                            onSaved: (String val) {
                              _setTime = val;
                            },
                            enabled: false,
                            keyboardType: TextInputType.text,
                            controller: _timeController,
                            decoration: InputDecoration(
                                disabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                contentPadding: EdgeInsets.all(5)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'End Time:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _selectTime2(context);
                        },
                        child: Container(
                          width: _width / 2,
                          height: _height / 13,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Colors.grey[200]),
                          child: TextFormField(
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                            onSaved: (String val) {
                              _setTime = val;
                            },
                            enabled: false,
                            keyboardType: TextInputType.text,
                            controller: _timeController2,
                            decoration: InputDecoration(
                                disabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                contentPadding: EdgeInsets.all(5)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _height / 9,
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 45.0,
                      child: RaisedButton(
                        color: _purple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ServiceProviderSelection()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14.0, vertical: 12.0),
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
            ),
          );
        },
      ),
    );
  }
}
