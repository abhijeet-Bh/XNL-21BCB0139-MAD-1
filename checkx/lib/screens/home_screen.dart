import 'package:checkx/utils/constants.dart';
import 'package:flutter/material.dart';

import '../components/credit_card.dart';
import '../components/transaction_card.dart';
import '../components/transaction_details_sheet.dart';
import '../utils/app_theme.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home-screen";
  const HomeScreen({Key? key}) : super(key: key);

  void _showTransactionDetails(BuildContext context, double amount,
      String txnId, String dateTime, String name, String payId) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.accent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return TransactionDetailsSheet(
          amount: amount,
          txnId: txnId,
          dateTime: dateTime,
          name: name,
          payId: payId,
        );
      },
    );
  }

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
                    "icon": Constants.bankTxnIcon,
                    "payId": "amazon@upi",
                    "txnId": "AX12345ZB1",
                    "dateTime": "Mar 14, 2025 - 10:30 AM"
                  },
                  {
                    "title": "Salary",
                    "subtitle": "Credited",
                    "amount": 50000.00,
                    "isIncome": true,
                    "icon": Constants.userTxnIcon,
                    "payId": "company@hdfc",
                    "txnId": "AX67890ZB2",
                    "dateTime": "Mar 13, 2025 - 05:00 PM"
                  },
                  {
                    "title": "Swiggy",
                    "subtitle": "Payment Successful",
                    "amount": 350.00,
                    "isIncome": false,
                    "icon": Constants.userTxnIcon,
                    "payId": "swiggy@paytm",
                    "txnId": "AX11111ZB3",
                    "dateTime": "Mar 12, 2025 - 08:15 PM"
                  },
                  {
                    "title": "Netflix",
                    "subtitle": "Subscription",
                    "amount": 199.00,
                    "isIncome": false,
                    "icon": Constants.userTxnIcon,
                    "payId": "netflix@icici",
                    "txnId": "AX22222ZB4",
                    "dateTime": "Mar 11, 2025 - 06:00 AM"
                  },
                  {
                    "title": "Freelance Work",
                    "subtitle": "Credited",
                    "amount": 10000.00,
                    "isIncome": true,
                    "icon": Constants.userTxnIcon,
                    "payId": "client@axis",
                    "txnId": "AX33333ZB5",
                    "dateTime": "Mar 10, 2025 - 03:45 PM"
                  },
                ];

                return GestureDetector(
                  onTap: () => _showTransactionDetails(
                    context,
                    transactions[index]["amount"] as double,
                    transactions[index]["txnId"].toString(),
                    transactions[index]["dateTime"].toString(),
                    transactions[index]["title"].toString(),
                    transactions[index]["payId"].toString(),
                  ),
                  child: TransactionCard(
                    title: transactions[index]["title"].toString(),
                    subtitle: transactions[index]["subtitle"].toString(),
                    amount: transactions[index]["amount"] as double,
                    isIncome: transactions[index]["isIncome"] as bool,
                    iconPath: transactions[index]["icon"].toString(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
