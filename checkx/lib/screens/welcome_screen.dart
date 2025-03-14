import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/primary_button.dart';
import '../utils/app_routes.dart';
import '../utils/app_theme.dart';
import '../utils/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1D),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppTheme.primary, AppTheme.background],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
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

                  // SVG Icon (Centered)
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: SvgPicture.asset(Constants.splashScreenCardIcon,
                        width: MediaQuery.of(context).size.width),
                  ),
                  const SizedBox(height: 80),

                  // Heading Texts
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
              // Title Text (Top Aligned)

              // Primary Button (Full Width)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PrimaryButton(
                  text: "Get Started",
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoutes.login),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
