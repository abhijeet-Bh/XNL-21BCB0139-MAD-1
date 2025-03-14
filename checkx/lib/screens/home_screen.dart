import 'package:checkx/utils/constants.dart';
import 'package:flutter/material.dart';

import '../components/credit_card.dart';
import '../components/transaction_card.dart';
import '../utils/app_theme.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home-screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button
        backgroundColor: AppTheme.backgroundColor,
        elevation: 0,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                "https://cdn.pixabay.com/photo/2018/11/08/23/52/man-3803551_1280.jpg",
              ),
            ),
            const SizedBox(width: 12),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello,", style: AppTheme.labelTextLarge),
                Text(" Abhijeet", style: AppTheme.headingText18),
              ],
            ),
            const Spacer(), // Pushes the notification icon to the right
            IconButton(
              icon: const Icon(Icons.notifications_active,
                  color: AppTheme.secondaryColor),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: AppTheme.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 14,
            ),
            // CREDIT CARD
            const CreditCard(
              bankName: "HDFC Bank",
              accountNumber: "123456789012",
              balance: 50234.75,
            ),
            const SizedBox(height: 24),

            // TRANSACTION HISTORY HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Transaction History",
                    style: AppTheme.headingText18),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/transactions');
                  },
                  child: const Text("See all", style: AppTheme.labelTextMedium),
                )
              ],
            ),
            const SizedBox(height: 12),

            // RECENT TRANSACTIONS
            ListView.builder(
              shrinkWrap: true, // Allows ListView inside Column
              physics:
                  const NeverScrollableScrollPhysics(), // Disables independent scrolling
              itemCount: 5,
              itemBuilder: (context, index) {
                final transactions = [
                  {
                    "title": "Amazon",
                    "subtitle": "Payment Successful",
                    "amount": 499.99,
                    "isIncome": false,
                    "icon": Constants.bankTxnIcon
                  },
                  {
                    "title": "Salary",
                    "subtitle": "Credited",
                    "amount": 50000.00,
                    "isIncome": true,
                    "icon": Constants.userTxnIcon
                  },
                  {
                    "title": "Swiggy",
                    "subtitle": "Payment Successful",
                    "amount": 350.00,
                    "isIncome": false,
                    "icon": Constants.userTxnIcon
                  },
                  {
                    "title": "Netflix",
                    "subtitle": "Subscription",
                    "amount": 199.00,
                    "isIncome": false,
                    "icon": Constants.userTxnIcon
                  },
                  {
                    "title": "Freelance Work",
                    "subtitle": "Credited",
                    "amount": 10000.00,
                    "isIncome": true,
                    "icon": Constants.userTxnIcon
                  },
                ];

                return TransactionCard(
                  title: transactions[index]["title"].toString(),
                  subtitle: transactions[index]["subtitle"].toString(),
                  amount: transactions[index]["amount"] as double,
                  isIncome: transactions[index]["isIncome"] as bool,
                  iconPath: transactions[index]["icon"].toString(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
