import 'package:checkx/components/primary_button.dart';
import 'package:checkx/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class TransactionSuccessScreen extends StatelessWidget {
  static const String routeName = "/transaction-success-screen";
  const TransactionSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String receiverName = args['receiverName'] ?? "";
    final String amount = args['amount'] ?? "";

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
          title: const Text("Transaction Successful",
              style: AppTheme.headingText18)),
      body: Padding(
        padding: AppTheme.pagePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 100, color: Colors.green),
            Text("₹ $amount sent to $receiverName",
                style: const TextStyle(fontSize: 24, color: Colors.white)),
            const SizedBox(height: 16),
            PrimaryButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, DashboardScreen.routeName, (route) => false);
              },
              text: "Done",
            ),
          ],
        ),
      ),
    );
  }
}
