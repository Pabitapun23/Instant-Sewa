import 'package:instantsewa/model/message.dart';
import 'package:intl/intl.dart';

class Notification {
  String id;
  String type;
  String messageTitle;
  String messageBody;
  String readTime;
  String updatedTime;

  Notification.fromJson(Map<String, dynamic> jsonMap)
      :
        id = jsonMap['identifier'],
        type = jsonMap['type'],
         readTime = jsonMap['read_at']==null?null : jsonMap['read_at'],
        updatedTime= timeAgoSinceDate(jsonMap['updated_at']),
        messageTitle = jsonMap['data']['title'],
        messageBody = jsonMap['data']['body'];


  static String timeAgoSinceDate(String dateString,
      {bool numericDates = true}) {
    print(dateString);
    int index = dateString.indexOf('T');
    DateTime date = new DateFormat("yyyy-MM-dd").parse(dateString);
   int hour = int.parse(dateString.substring(index+1,index+3));
    int min = int.parse(dateString.substring(index+4,index+6));
    int sec = int.parse(dateString.substring(index+7,index+9));
   DateTime date3 = date.add(Duration(hours:hour,minutes:min,seconds: sec));
    // DateTime notificationDate = DateFormat("dd-MM-yyyy h:mma").parse(
    //     dateString);
     final date2 = DateTime.now();
     final difference = date2.difference(date3);
   print(difference);
     if (difference.inDays > 8) {
      return dateString;
     } else if ((difference.inDays / 7).floor() >= 1) {
       return (numericDates) ? '1 week ago' : 'Last week';
     } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }
}