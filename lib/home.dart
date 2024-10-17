import 'package:flutter/material.dart';
import 'package:test_noti/local_notifications.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    listenToNotifications();
    super.initState();
  }

  // to listen to any notification clicked or not
  listenToNotifications() {
    print("Listening to notification");
    LocalNotifications.onClickNotification.stream.listen((event) {
      print("inside listen in home.dart");
      print(event);

      Navigator.pushNamed(context, '/another', arguments: event);
    });
  }

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
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.timer_outlined),
            onPressed: () {
              LocalNotifications.showScheduleNotification(
                  title: "Schedule Notification",
                  body: "This is a Schedule Notification",
                  payload: "This is schedule data");
            },
            label: const Text("Schedule Notifications"),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.stop_circle_outlined),
            onPressed: () {
              LocalNotifications.cancel(1);
            },
            label: const Text("Close Periodic Notifications"),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.stop_circle_outlined),
            onPressed: () {
              LocalNotifications.cancelAll();
            },
            label: const Text("Close All Notifications"),
          ),
        ],
      ),
    );
  }
}
