import 'package:flutter/material.dart';
import 'package:test_noti/local_notifications.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Local Notifications"),
      ),
      body: Column(
        children: [
          ElevatedButton.icon(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              LocalNotifications.showSimpleNotification(
                title: "Simple Notification",
                body: "This is a simple notification",
                payload: "This is a simple data",
              );
            },
            label: const Text("Simple Notification"),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.timer_outlined),
            onPressed: () {
              LocalNotifications.showPeriodicNotification(
                title: "Periodic Notification",
                body: "This is a Periodic notification",
                payload: "This is a periodic data",
                // interval: 1,
              );
            },
            label: const Text("Periodic Notification"),
          )
        ],
      ),
    );
  }
}
