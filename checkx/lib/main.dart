import 'package:checkx/models/transaction_model.dart';
import 'package:checkx/screens/ammount-screen.dart';
import 'package:checkx/screens/dashboard_screen.dart';
import 'package:checkx/screens/enterpin-screen.dart';
import 'package:checkx/screens/my_accounts_screen.dart';
import 'package:checkx/screens/transaction-success-screen.dart';
import 'package:checkx/screens/transactions_history_screen.dart';
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

  if (!userBox.containsKey("user")) {
    var newUser = UserModel(
      userId: "abhijeet@checkx",
      firstName: "Abhijeet",
      lastName: "Bhardwaj",
      transactionPin: "1234",
      accounts: [
        BankAccount(
            accountNumber: "1234567890", balance: 5000, bankName: "HDFC Bank"),
        BankAccount(
            accountNumber: "9876543210",
            balance: 5000,
            bankName: "Bank of India"),
      ],
    );
    await userBox.put("user", newUser);
  }

  runApp(const ProviderScope(child: MyApp(isFirstTime: false)));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CheckX',
      theme: AppTheme.themeData,
      initialRoute: isFirstTime ? AppRoutes.welcome : DashboardScreen.routeName,
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
      routes: {
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
