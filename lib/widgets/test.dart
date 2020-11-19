import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/model/service_user_date_and_time_model.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:intl/intl.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulePage extends StatefulWidget {
  final String subCategoryName, latitude, longitude;

  const SchedulePage(
      {Key key, this.subCategoryName, this.latitude, this.longitude})
      : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dateController.text = DateFormat('yyyy/MM/dd').format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2020, 11, 11, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, ':', ss, " ", am]).toString();
    _timeController2.text = formatDate(
        DateTime(2020, 11, 11, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, ':', ss, " ", am]).toString();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat('dd/MM/yyyy').format(DateTime.now());
    return Scaffold(
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
          final _serviceUserDateAndTimeModel =
              RM.get<ServiceUserDateAndTimeModel>();
          return SafeArea(
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
                        "Select the service date",
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
                              StateBuilder(
                                observe: () => _serviceUserDateAndTimeModel,
                                builder: (_, model) {
                                  return InkWell(
                                    onTap: () async {
                                      final DateTime picked =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: selectedDate,
                                              builder: (BuildContext context,
                                                  Widget child) {
                                                return Theme(
                                                  data: ThemeData(
                                                      primaryColor:
                                                          Color(0xFF603f8b),
                                                      accentColor:
                                                          Color(0xFF603f8b),
                                                      primarySwatch:
                                                          _buttonColor),
                                                  child: child,
                                                );
                                              },
                                              initialDatePickerMode:
                                                  DatePickerMode.day,
                                              firstDate: DateTime(
                                                  DateTime.now().year - 1),
                                              lastDate: DateTime(
                                                  DateTime.now().year + 2));
                                      if (picked != null)
                                        setState(() {
                                          selectedDate = picked;
                                          _dateController.text =
                                              DateFormat('yyyy/MM/dd')
                                                  .format(selectedDate);
                                          _serviceUserDateAndTimeModel.setState(
                                              (state) => state.setDate(
                                                  _dateController.text));
                                        });
                                    },
                                    child: Container(
                                      width: _width / 2,
                                      height: _height / 13,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200]),
                                      child: TextFormField(
                                        style: TextStyle(fontSize: 20),
                                        textAlign: TextAlign.center,
                                        onSaved: (String val) {
                                          _setTime = val;
                                        },
                                        enabled: false,
                                        keyboardType: TextInputType.text,
                                        controller: _dateController,
                                        decoration: InputDecoration(
                                            disabledBorder:
                                                UnderlineInputBorder(
                                                    borderSide:
                                                        BorderSide.none),
                                            contentPadding: EdgeInsets.all(5)),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Start Time:',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  StateBuilder(
                                    observe: () => _serviceUserDateAndTimeModel,
                                    builder: (_, model) {
                                      return InkWell(
                                        onTap: () async {
                                          TimeOfDay picked =
                                              await showTimePicker(
                                                  context: context,
                                                  initialTime: selectedTime,
                                                  builder:
                                                      (BuildContext context,
                                                          Widget child) {
                                                    return Theme(
                                                      data: ThemeData(
                                                          primaryColor:
                                                              Color(0xFF603f8b),
                                                          accentColor:
                                                              Color(0xFF603f8b),
                                                          primarySwatch:
                                                              _buttonColor),
                                                      child: child,
                                                    );
                                                  });
                                          if (picked != null)
                                            setState(() {
                                              selectedTime = picked;
                                              _hour =
                                                  selectedTime.hour.toString();
                                              _minute = selectedTime.minute
                                                  .toString();
                                              _time = _hour + ' : ' + _minute;
                                              _timeController.text = _time;
                                              _timeController.text = formatDate(
                                                  DateTime(
                                                      2020,
                                                      11,
                                                      10,
                                                      selectedTime.hour,
                                                      selectedTime.minute),
                                                  [
                                                    hh,
                                                    ':',
                                                    nn,
                                                    ':',
                                                    ss,
                                                    " ",
                                                    am
                                                  ]).toString();
                                            });
                                          _serviceUserDateAndTimeModel.setState(
                                              (state) => state.setStartTime(
                                                  _timeController.text));
                                        },
                                        child: Container(
                                          width: _width / 2,
                                          height: _height / 13,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200]),
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
                                                disabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none),
                                                contentPadding:
                                                    EdgeInsets.all(5)),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      StateBuilder(
                        observe: () => _serviceUserDateAndTimeModel,
                        builder: (_, model) {
                          return Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 80),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Color.fromRGBO(49, 39, 79, 1),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  // if (!_serviceUserDateAndTimeModel.state
                                  //     .validateData()) {
                                  //   showSnackBar(
                                  //       key: _key,
                                  //       color: Colors.red,
                                  //       message:
                                  //       "Data is invalid,please fill before submitting the form");
                                  // } else {
                                  //   _addressUpdateModel.setState(
                                  //           (addressState) async {
                                  //         await addressState.updateAddress();
                                  //         Navigator.pushNamed(context, homeRoute);
                                  //       },
                                  //       onError: (context, error) =>
                                  //           showSnackBar(
                                  //               key: _key,
                                  //               color: Colors.red,
                                  //               message: "{$error.message}"));
                                  // }
                                },
                                child: Text(
                                  "Next",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
