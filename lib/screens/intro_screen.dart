// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:globo_fitness/screens/notification_payload_screen.dart';
import 'package:globo_fitness/services/local_notification_service.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late final LocalNotificationService service = LocalNotificationService();

  @override
  void initState() {
    service.init();
    listenToNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Local Notification',
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/dog.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                service.showNotification(
                  id: 0,
                  title: 'Notification Title',
                  body: 'Some boby',
                );
              },
              child: const Text('Show Local Notification'),
            ),
            ElevatedButton(
              onPressed: () async {
                service.showNotificationWithPayload(
                  id: 2,
                  title: 'Notification Title',
                  body: 'Some boby',
                  payload: 'Payload Navigation',
                );
              },
              child: const Text('Show Notification with Payload'),
            ),
          ],
        ),
      ),
    );
  }

  void listenToNotification() {
    service.onNotificationClick.stream.listen(onNotificationListener);
  }

  void onNotificationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NotificationPayloadScreen(payload: payload),
        ),
      );
    }
  }
}
