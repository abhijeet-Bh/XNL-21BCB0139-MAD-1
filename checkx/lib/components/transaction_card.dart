import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_theme.dart';

class TransactionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double amount;
  final bool isIncome; // True for credit, false for debit
  final String iconPath;

  const TransactionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.isIncome,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppTheme.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 55,
            height: 69,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                width: 30,
                height: 30,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title.length > 11 ? "${title.substring(0, 10)}..." : title,
                    style: AppTheme.headingText18),
                Text(subtitle, style: AppTheme.labelTextSmall),
              ],
            ),
          ),
          Text(
            (isIncome ? "+ ₹" : "- ₹") + amount.toStringAsFixed(2),
            // style: isIncome ? AppTheme.incomeText : AppTheme.expenseText,
            style: isIncome
                ? AppTheme.headingText22.copyWith(color: Colors.greenAccent)
                : AppTheme.headingText22.copyWith(color: Colors.redAccent),
          ),
        ],
      ),
    );
  }
}
