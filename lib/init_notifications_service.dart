import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn_pos/services/notifications_service.dart';

class InitNotificationsService extends StatefulWidget {
  final Widget? child;

  InitNotificationsService({Key? key, this.child}) : super(key: key);

  @override
  _InitNotificationsServiceState createState() =>
      _InitNotificationsServiceState();
}

class _InitNotificationsServiceState extends State<InitNotificationsService> {
  final NotificationsService _notificationsService = NotificationsService();

  @override
  void initState() => {init(), super.initState()};

  @override
  Widget build(BuildContext context) => widget.child!;

  Future<void> init() async {
    await FirebaseMessaging.instance.subscribeToTopic('all');
    await _notificationsService.initLocalService();
    _notificationsService.listenToOnMessage();
  }
}
