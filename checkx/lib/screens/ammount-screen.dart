import 'package:checkx/components/primary_button.dart';
import 'package:checkx/screens/enterpin-screen.dart';
import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class EnterAmountScreen extends StatefulWidget {
  static const String routeName = "/enter-amount-screen";
  const EnterAmountScreen({Key? key}) : super(key: key);

  @override
  _EnterAmountScreenState createState() => _EnterAmountScreenState();
}

class _EnterAmountScreenState extends State<EnterAmountScreen> {
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map<String, String> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String userName = args['userName'] ?? "";
    final String userId = args['userId'] ?? "";

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text("Transfer Money", style: AppTheme.headingText18),
      ),
      body: Padding(
        padding: AppTheme.pagePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(userName, style: AppTheme.headingText18),
                  Text(userId, style: AppTheme.labelTextMedium),
                  TextField(
                    controller: _amountController,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 46, color: Colors.white),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "₹ 0.00",
                      hintStyle: TextStyle(fontSize: 46, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                text: "Continue",
                onPressed: () {
                  final amount = _amountController.text.trim();
                  if (amount.isNotEmpty) {
                    Navigator.pushNamed(
                      context,
                      EnterPinScreen.routeName,
                      arguments: {
                        'userName': userName,
                        'userId': userId,
                        'amount': amount,
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
