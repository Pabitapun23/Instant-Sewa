import 'package:dio/dio.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/category/category.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/classes/notification/notification.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';

abstract class NotificationRepository{
  Future<List<Notification>> getNotification();
}
class NotificationRepositoryImpl implements NotificationRepository{
  @override
  Future<List<Notification>> getNotification() async {
    try{
      final response = await InstantSewaAPI.dio.get("/notification",options: Options(
          headers: {
            'Authorization':"Bearer ${LocalStorage.getItem(TOKEN)}"
          }
      ));
      List _temp = response.data;
      List<Notification> _notifications = _temp.map((_notification) => Notification.fromJson(_notification)).toList();
      return _notifications;

    }on DioError catch(e){
      throw showNetworkError(e);
    }
  }

}