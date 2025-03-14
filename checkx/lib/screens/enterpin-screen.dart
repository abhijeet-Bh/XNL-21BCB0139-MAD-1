import 'package:checkx/components/primary_button.dart';
import 'package:checkx/screens/transaction-success-screen.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../utils/app_theme.dart';

class EnterPinScreen extends StatefulWidget {
  static const String routeName = "/enter-pin-screen";

  const EnterPinScreen({Key? key}) : super(key: key);

  @override
  _EnterPinScreenState createState() => _EnterPinScreenState();
}

class _EnterPinScreenState extends State<EnterPinScreen> {
  final TextEditingController _pinController = TextEditingController();

  void _onConfirm() {
    if (_pinController.text.length == 4) {
      final Map<String, String> args =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      Navigator.pushReplacementNamed(
        context,
        TransactionSuccessScreen.routeName,
        arguments: args,
      );
    }
  }

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
          children: [
            // User Details Card
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter your PIN to continue",
                    style: AppTheme.labelTextMedium
                        .copyWith(color: AppTheme.accent),
                  ),
                  const SizedBox(height: 24),

                  // PIN Input Field
                  Pinput(
                    controller: _pinController,
                    length: 4,
                    obscureText: true,
                    obscuringWidget: const Text(
                      "●",
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                    defaultPinTheme: PinTheme(
                      width: 50,
                      height: 50,
                      textStyle:
                          const TextStyle(fontSize: 32, color: Colors.white),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.5), width: 2),
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                    // onCompleted: (pin) => _onConfirm(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Confirm Button
            PrimaryButton(
              onPressed: _onConfirm,
              text: "Confirm",
            ),
          ],
        ),
      ),
    );
  }
}
