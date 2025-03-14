import 'package:checkx/models/transaction_model.dart';
import 'package:checkx/screens/ammount-screen.dart';
import 'package:checkx/screens/dashboard_screen.dart';
import 'package:checkx/screens/enterpin-screen.dart';
import 'package:checkx/screens/my_accounts_screen.dart';
import 'package:checkx/screens/transaction-success-screen.dart';
import 'package:checkx/screens/transactions_history_screen.dart';
import 'package:checkx/screens/welcome_screen.dart';
import 'package:checkx/utils/app_routes.dart';
import 'package:checkx/utils/request-notification-permission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

import 'models/user-model.dart';
import 'utils/app_theme.dart';

final FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(BankAccountAdapter());
  Hive.registerAdapter(TransactionModelAdapter());

  await requestPermissions();

  var userBox = await Hive.openBox<UserModel>('userBox');
  var settingsBox = await Hive.openBox('settingsBox');

  bool isFirstTime = settingsBox.get("isFirstTime", defaultValue: true);

  runApp(ProviderScope(child: MyApp(isFirstTime: isFirstTime)));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CheckX',
      theme: AppTheme.themeData,
      initialRoute:
          isFirstTime ? WelcomeScreen.routeName : DashboardScreen.routeName,
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
      routes: {
        WelcomeScreen.routeName: (ctx) => const WelcomeScreen(),
        DashboardScreen.routeName: (ctx) => const DashboardScreen(),
        MyAccountsScreen.routeName: (ctx) => MyAccountsScreen(),
        EnterAmountScreen.routeName: (ctx) => const EnterAmountScreen(),
        EnterPinScreen.routeName: (ctx) => const EnterPinScreen(),
        TransactionSuccessScreen.routeName: (ctx) =>
            const TransactionSuccessScreen(),
        TransactionsHistoryScreen.routeName: (ctx) =>
            TransactionsHistoryScreen(),
      },
    );
  }
}
