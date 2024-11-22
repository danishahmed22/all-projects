import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';
import 'background_notification_service.dart';
import 'dashboard_screen.dart';
import 'news_carousel_and_card/carousel.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initNotifications();
  await initializeService();
  runApp(MyApp());
}

Future<void> initNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
  );
  final NotificationAppLaunchDetails? notificationAppLaunchDetails =
  await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
    print("App launched from notification");
    onDidReceiveNotificationResponse(notificationAppLaunchDetails!.notificationResponse!);
  }
}

void onDidReceiveNotificationResponse(NotificationResponse details) async {
  print("Notification received with payload: ${details.payload}");
  final String? payload = details.payload;
  if (payload == 'dashboard') {
    print("Navigating to dashboard");
    Future.delayed(Duration(milliseconds: 100), () {
      navigatorKey.currentState?.pushNamed('/dashboard');
    });
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'News App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Financial News')),
      body: Column(
        children: [
          Expanded(child: NewsCarousel()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('View Dashboard'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/dashboard');
                  },
                ),
                ElevatedButton(
                  child: Text('Test Notification'),
                  onPressed: () async {
                    await showNotification();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

