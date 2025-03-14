import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/primary_button.dart';
import '../utils/app_theme.dart';
import '../utils/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppTheme.primary, AppTheme.background],
          ),
        ),
        child: Padding(
          padding: AppTheme.pagePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                Constants.checkXLogo,
                width: 142,
              ),
              const SizedBox(height: 20),
              Text(
                "Login to continue",
                style: AppTheme.displayText.copyWith(fontSize: 32),
              ),
              const SizedBox(height: 10),
              Text(
                "Login using Google or Apple to continue your CheckX Account",
                textAlign: TextAlign.left,
                style: AppTheme.bodyTextLarge.copyWith(color: AppTheme.accent),
              ),
              const SizedBox(height: 40),
              Center(
                child: SvgPicture.asset(
                  Constants.currencyIcon,
                  height: 258,
                  width: 258,
                ),
              ),
              const SizedBox(height: 50),
              PrimaryButton(
                text: "Continue with Google",
                onPressed: () {
                  // TODO: Implement Google OAuth
                },
                color: AppTheme.accent,
                icon: Constants.googleIcon,
                textColor: Colors.black,
              ),
              const SizedBox(height: 15),
              PrimaryButton(
                text: "Continue with Apple",
                onPressed: () {
                  // TODO: Implement Apple OAuth
                },
                color: AppTheme.primary,
                icon: Constants.appleIcon,
                textColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
