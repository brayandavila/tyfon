import 'package:flutter/material.dart';
import 'package:tyfon/app/views/routes/app_routes.dart';
import 'package:tyfon/app/views/routes/routes.dart';
import 'package:flutter_meedu/flutter_meedu.dart' as router;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Silka Bold',
                  color: Color(0xFF030047)))),
      navigatorKey: router.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      navigatorObservers: [
        router.observer,
      ],
      routes: appRoutes,
    );
  }
}
