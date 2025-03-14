import 'package:flutter/material.dart';

import '../components/credit_card.dart';
import '../components/primary_button.dart';
import '../utils/app_theme.dart';

class MyAccountsScreen extends StatelessWidget {
  static const String routeName = "/my-accounts";

  final List<Map<String, dynamic>> accounts = [
    {
      "bankName": "HDFC Bank",
      "accountNumber": "1234 5678 9012",
      "balance": 50234.75,
    },
  ];

  MyAccountsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button
        centerTitle: false,
        backgroundColor: AppTheme.backgroundColor,
        title: const Text("My Accounts", style: AppTheme.headingText18),
        elevation: 0,
      ),
      body: Padding(
        padding: AppTheme.pagePadding,
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                final account = accounts[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14.0),
                  child: CreditCard(
                    bankName: account["bankName"].toString(),
                    accountNumber: account["accountNumber"].toString(),
                    balance: account["balance"] as double,
                  ),
                );
              },
            ),
            PrimaryButton(
              text: "+ Add New Card",
              onPressed: () {},
              color: AppTheme.accent,
              textColor: Colors.black,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
