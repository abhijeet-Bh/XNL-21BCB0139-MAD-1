import 'package:checkx/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_theme.dart';

class TransactionDetailsSheet extends StatelessWidget {
  final String name;
  final String payId;
  final double amount;
  final String txnId;
  final String dateTime;

  const TransactionDetailsSheet({
    Key? key,
    required this.amount,
    required this.txnId,
    required this.dateTime,
    required this.name,
    required this.payId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Take full width
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      decoration: const BoxDecoration(
        color: AppTheme.accent,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: SvgPicture.asset(
              Constants.tickIcon,
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(height: 16),

          // "Transaction Successful" Text
          const Text(
            "Transaction Successful",
            style: AppTheme.headingText22,
          ),
          const SizedBox(height: 12),

          // Amount
          Text(
            "₹ ${amount.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 42,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          // Receiver Name & ID
          Text(
            name,
            style:
                AppTheme.labelTextMedium.copyWith(color: AppTheme.primaryColor),
          ),
          Text(
            payId,
            style:
                AppTheme.labelTextMedium.copyWith(color: AppTheme.primaryColor),
          ),
          const SizedBox(height: 12),

          // Transaction ID
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: "Transaction Id:  ",
                  style: AppTheme.labelTextLarge,
                ),
                TextSpan(
                  text: txnId,
                  style: AppTheme.labelTextLarge
                      .copyWith(color: AppTheme.primaryColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Date & Time
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: "Date & Time: ",
                  style: AppTheme.labelTextLarge,
                ),
                TextSpan(
                  text: dateTime,
                  style: AppTheme.labelTextLarge
                      .copyWith(color: AppTheme.primaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
