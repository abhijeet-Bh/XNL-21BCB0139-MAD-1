import 'package:checkx/components/primary_button.dart';
import 'package:checkx/providers/transaction_provider.dart';
import 'package:checkx/screens/transaction-success-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:pinput/pinput.dart';

import '../models/user-model.dart';
import '../utils/app_theme.dart';

class EnterPinScreen extends ConsumerStatefulWidget {
  static const String routeName = "/enter-pin-screen";

  const EnterPinScreen({Key? key}) : super(key: key);

  @override
  _EnterPinScreenState createState() => _EnterPinScreenState();
}

class _EnterPinScreenState extends ConsumerState<EnterPinScreen> {
  final TextEditingController _pinController = TextEditingController();
  int wrongPinCount = 0;

  void _onConfirm() async {
    final Map<String, String> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String userId = args['userId'] ?? "";
    final String receiverId = args['receiverId'] ?? "";
    final double amount = double.parse(args['amount'] ?? "0");

    var userBox = await Hive.openBox<UserModel>('userBox');
    UserModel? user = userBox.get("user");

    debugPrint(user?.accounts[0].balance.toString());
    debugPrint(user.toString());
    debugPrint(_pinController.text);

    if (user != null && user.transactionPin == _pinController.text) {
      // Process transaction
      bool success = await ref
          .read(transactionsProvider.notifier)
          .processTransaction(senderId: userId, amount: amount);

      if (success) {
        Navigator.pushReplacementNamed(
          context,
          TransactionSuccessScreen.routeName,
          arguments: args,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Insufficient Balance"),
              backgroundColor: Colors.red),
        );
      }
    } else {
      wrongPinCount++;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("Wrong PIN! Attempt: $wrongPinCount"),
            backgroundColor: Colors.red),
      );

      if (wrongPinCount >= 3) {
        _showSecurityAlert();
      }
    }
  }

  void _showSecurityAlert() async {
    FlutterLocalNotificationsPlugin notificationsPlugin =
        FlutterLocalNotificationsPlugin();

    var androidDetails = const AndroidNotificationDetails(
      'security_alert_channel',
      'Security Alerts',
      importance: Importance.high,
    );

    var platformDetails = NotificationDetails(android: androidDetails);
    await notificationsPlugin.show(
      1,
      "Security Alert",
      "Multiple incorrect PIN attempts detected! Possible fraud attempt.",
      platformDetails,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar:
          AppBar(title: const Text("Enter PIN", style: AppTheme.headingText18)),
      body: Padding(
        padding: AppTheme.pagePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text("Enter your PIN to continue",
                      style: AppTheme.labelTextMedium
                          .copyWith(color: AppTheme.accent)),
                  const SizedBox(height: 24),
                  Pinput(
                    controller: _pinController,
                    length: 4,
                    obscureText: true,
                    obscuringWidget: const Text("●",
                        style: TextStyle(fontSize: 32, color: Colors.white)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            PrimaryButton(onPressed: _onConfirm, text: "Confirm"),
          ],
        ),
      ),
    );
  }
}
