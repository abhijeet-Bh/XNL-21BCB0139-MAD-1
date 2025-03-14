import 'package:checkx/screens/dashboard_screen.dart';
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
            colors: [AppTheme.primaryColor, AppTheme.backgroundColor],
          ),
        ),
        child: Padding(
          padding: AppTheme.pagePadding,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    SvgPicture.asset(
                      Constants.checkXLogo,
                      width: 233,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Login to continue",
                      style: AppTheme.displayText.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Login using Google or Apple to continue your CheckX Account",
                      textAlign: TextAlign.left,
                      style: AppTheme.bodyTextLarge
                          .copyWith(color: AppTheme.accent),
                    ),
                  ],
                ),
                Center(
                  child: SvgPicture.asset(
                    Constants.currencyIcon,
                    height: 258,
                    width: 258,
                  ),
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                    PrimaryButton(
                      text: "Continue with Google",
                      // onPressed: () {
                      //   // TODO: Implement Google OAuth
                      //   Navigator.pushNamed(context, DashboardScreen.routeName);
                      // },
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        DashboardScreen.routeName,
                        (route) => false,
                      ),
                      color: AppTheme.accent,
                      icon: Constants.googleIcon,
                      textColor: Colors.black,
                    ),
                    const SizedBox(height: 22),
                    PrimaryButton(
                      text: "Continue with Apple",
                      onPressed: () {
                        // TODO: Implement Apple OAuth
                      },
                      color: AppTheme.primaryColor,
                      icon: Constants.appleIcon,
                      textColor: Colors.black,
                    ),
                    const SizedBox(height: 22),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
