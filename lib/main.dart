import 'package:flutter/material.dart' hide Router;
import 'package:Waterly/app/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waterly',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // initialRoute: Routes.startupView,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
