import 'package:checkx/screens/dashboard_screen.dart';
import 'package:checkx/utils/app_routes.dart';
import 'package:flutter/material.dart';

import 'utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CheckX',
      theme: AppTheme.themeData,
      initialRoute: AppRoutes.welcome,
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
      routes: {DashboardScreen.routeName: (ctx) => const DashboardScreen()},
    );
  }
}
