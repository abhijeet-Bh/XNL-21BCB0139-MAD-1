import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

import '../components/primary_button.dart';
import '../models/user-model.dart';
import '../utils/app_theme.dart';
import '../utils/constants.dart';
import 'dashboard_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = "/welcome";

  const WelcomeScreen({super.key});

  Future<void> _initializeUserData(BuildContext context) async {
    var userBox = await Hive.openBox<UserModel>('userBox');
    var settingsBox = await Hive.openBox('settingsBox');

    if (!userBox.containsKey("user")) {
      var newUser = UserModel(
        userId: "abhijeet@checkx",
        firstName: "Abhijeet",
        lastName: "Bhardwaj",
        transactionPin: "1234",
        accounts: [
          BankAccount(
              accountNumber: "1234567890",
              balance: 5000,
              bankName: "HDFC Bank"),
          BankAccount(
              accountNumber: "9876543210",
              balance: 5000,
              bankName: "Bank of India"),
        ],
      );
      await userBox.put("user", newUser);
    }

    // Set first-time flag to false
    await settingsBox.put("isFirstTime", false);

    // Navigate to Dashboard
    Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1D),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppTheme.primaryColor, AppTheme.backgroundColor],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: SvgPicture.asset(
                      Constants.checkXLogo,
                      width: 100,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: SvgPicture.asset(Constants.splashScreenCardIcon,
                        width: MediaQuery.of(context).size.width),
                  ),
                  const SizedBox(height: 80),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Transfer your money \nwith one click \nOn the Go .... ",
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: "RedHatDisplay",
                        color: AppTheme.accent,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PrimaryButton(
                  text: "Get Started",
                  onPressed: () => _initializeUserData(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
