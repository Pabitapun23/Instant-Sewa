import 'package:flutter/material.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/ui/service_provider_selection.dart';
import 'package:intl/intl.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ServiceUserDateAndTimeModel {
  DateTime date;
  DateTime time;
  DateTime startDate;
  DateTime endDate;
  String subCategory;
  String latitude;
  String longitude;
  String address;
  List<String> cartList;
  DateTime now = DateTime.now();

  void setDate(String date) {
    DateTime date2 = new DateFormat('yyyy/MM/dd').parse(date);
    if (changeDate(now).difference(changeDate(date2)).inHours > 0) {
      throw CommonError(message: "Invalide Email");
    } else {
      this.date = date2;
    }
  }

  DateTime changeDate(DateTime dateTime) =>
      DateTime(dateTime.year, dateTime.month, dateTime.day);

  void setStartTime({
    String time,
    String subCategory,
    String latitude,
    String longitude,
    String address,
    List<String> cartList,
  }) {
    DateTime timer = new DateFormat.jms().parse(time);
    if (this.date == null) {
      this.date = new DateFormat('yyyy/MM/dd')
          .parse(new DateFormat('yyyy/MM/dd').format(DateTime.now()));
    }
    DateTime starter;
    starter =
        this.date.add(new Duration(hours: timer.hour, minutes: timer.minute));
    if (this.now.difference(starter).inMinutes > 0) {
      throw CommonError(message: "Invalide Email");
    }
    this.startDate = starter;
    this.subCategory = subCategory;
    this.latitude = latitude;
    this.longitude = longitude;
    this.cartList = cartList;
    this.address = address;
  }

  void setEndTime(String time) {
    DateTime timer = new DateFormat.jms().parse(time);
    if (this.date == null) {
      this.date = new DateFormat('yyyy/MM/dd')
          .parse(new DateFormat('yyyy/MM/dd').format(DateTime.now()));
    }
    DateTime ender;
    ender =
        this.date.add(new Duration(hours: timer.hour, minutes: timer.minute));
    if (ender.difference(this.startDate).inMinutes < 30) {
      throw CommonError(message: "Invalide Email");
    }
    this.endDate = ender;
  }

  bool validateData() {
    return this.longitude != null &&
        this.latitude != null &&
        this.startDate != null &&
        this.endDate != null &&
        this.subCategory != null &&
        this.cartList != null &&
        this.address != null;
  }

  Future<void> sendData() async {
    if (validateData()) {
      Navigator.push(
        RM.context,
        MaterialPageRoute(
          builder: (BuildContext context) => ServiceProviderSelection(
            subCategoryName: this.subCategory,
            latitude: this.latitude,
            longitude: this.longitude,
            startTime: this.startDate.toString(),
            endTime: this.endDate.toString(),
            cartList: this.cartList,
            address: this.address,
          ),
        ),
      );
    } else {
      print(this.cartList);
    }
  }
}

extension MyDateUtils on DateTime {
  DateTime copyWith(
      {int year,
      int month,
      int day,
      int hour,
      int minute,
      int second,
      int millisecond,
      int microsecond}) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }
}
