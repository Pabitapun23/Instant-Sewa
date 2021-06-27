import 'package:instantsewa/application/classes/notification/notification.dart';
import 'package:instantsewa/repositories/notification_repository.dart';

class NotificationState{
  final NotificationRepository _notificationRepository;
  NotificationState(this._notificationRepository): assert(_notificationRepository != null);
  List<Notification> _notifications = [];
  List<Notification> get notifications => _notifications;
  Future getNotification() async
  {
    _notifications= await _notificationRepository.getNotification();
  }
}