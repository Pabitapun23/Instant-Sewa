import 'package:instantsewa/state/service_provider_selection_state.dart';
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
  DateTime now = DateTime.now();

  void setDate(String date) {
    DateTime date2 =new DateFormat('yyyy/MM/dd').parse(date);
    print(date2);
    this.date = date2;
//   if (changeDate(now).difference(changeDate(date2)).inHours < 0) {
 //     print('Amrita');
//    }
//    else{
//
//    }
  }

  DateTime setStartTime(String time) {
    print(this.date);
    DateTime timer = new DateFormat.jms().parse(time);
    DateTime dater= new DateFormat('yyyy/MM/dd').parse(new DateFormat('yyyy/MM/dd').format(DateTime.now()));
    this.startDate =  dater.add(new Duration(hours: timer.hour,minutes: timer.minute));
    //print(this.startDate);
  }
  DateTime setEndTime(String time) {
    DateTime timer = new DateFormat.jms().parse(time);
    DateTime dater= new DateFormat('yyyy/MM/dd').parse(new DateFormat('yyyy/MM/dd').format(DateTime.now()));
    this.endDate =  dater.add(new Duration(hours: timer.hour,minutes: timer.minute));
    print(this.endDate);
  }
  Future<void>sendData() async
 {
   //     subCategoryName:this.subCategory,
   //     latitude: this.latitude,
   //     longitude: this.longitude,
   //     startTime: this.startDate,
   //     endTime: this.endDate );
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