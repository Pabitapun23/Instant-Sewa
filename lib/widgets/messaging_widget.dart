import 'dart:io';
import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/model/message.dart';

class MessagingWidget extends StatefulWidget {
  const MessagingWidget({Key key}) : super(key: key);

  @override
  _MessagingWidgetState createState() => _MessagingWidgetState();
}


class _MessagingWidgetState extends State<MessagingWidget> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<Message> messages = [];
  StreamSubscription iosSubscription;
  @override
  void initState() {
    super.initState();
    _firebaseMessaging.subscribeToTopic('tracking_notification');
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        final notification = message['notification'];
         setState(() {
           messages.add(Message(title: notification['title'],
              body: notification['body']));
         });
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    if (Platform.isIOS) {
      iosSubscription = _firebaseMessaging.onIosSettingsRegistered.listen((data) {
        _saveDeviceToken();
      });
      _firebaseMessaging.requestNotificationPermissions(
          const IosNotificationSettings(sound: true, badge: true, alert: true));
    }
    else
      {
      _saveDeviceToken();
    }
  }
  _saveDeviceToken() async
  {
    String fcmToken = await _firebaseMessaging.getToken();
    print(fcmToken);
  }
  @override
  Widget build(BuildContext context)=>ListView(
    children: messages.map(buildMessage).toList(),
  );
  Widget buildMessage(Message message) => ListTile(
    title: Text(message.title),
    subtitle: Text(message.body),
  );
}
