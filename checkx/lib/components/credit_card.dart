import 'package:checkx/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_theme.dart';

class CreditCard extends StatelessWidget {
  final String bankName;
  final String accountNumber;
  final double balance;

  const CreditCard({
    Key? key,
    required this.bankName,
    required this.accountNumber,
    required this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  Constants.bankIcon, // Add this path in `AppTheme.dart`
                  height: 80,
                  width: 80,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bankName,
                        style: AppTheme.headingText18
                            .copyWith(color: AppTheme.accent),
                      ),
                      Text(
                        "•••• •••• ${accountNumber.substring(accountNumber.length - 4)}",
                        style: AppTheme.headingText22
                            .copyWith(color: AppTheme.accent),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "₹${balance.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: AppTheme.whiteText,
                    fontWeight: FontWeight.bold,
                    fontFamily: "RedHatDisplay",
                    fontSize: 36,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
