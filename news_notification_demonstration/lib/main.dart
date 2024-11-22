import 'package:flutter/material.dart';
import 'package:news_notification_demonstration/screen/dashboard_screen.dart';
import 'package:news_notification_demonstration/screen/news_home_page.dart';
import 'package:news_notification_demonstration/service/api_service.dart';
import 'package:news_notification_demonstration/service/notification_service.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    print("Native called background task: $task");
    final newsService = NewsService();
    await newsService.fetchAndCacheNews();
    return Future.value(true);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();
  NotificationService().startRepeatingNotification();

  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );
  Workmanager().registerPeriodicTask(
    "1",
    "fetchNews",
    frequency: Duration(hours: 12),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => NewsHomePage(),
        '/dashboard': (context) => DashboardScreen(),
      },
      initialRoute: '/',
      navigatorKey: GlobalKey<NavigatorState>(), // Add a key for navigation
      builder: (context, child) {
        return child!;
      },
    );
  }
}
