import 'package:flutter/material.dart';

import '../components/transaction_card.dart';
import '../components/transaction_details_sheet.dart';
import '../utils/app_theme.dart';
import '../utils/constants.dart';

class TransactionsHistoryScreen extends StatelessWidget {
  static const String routeName = "/transactions-history";

  final List<Map<String, dynamic>> transactions = [
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

  TransactionsHistoryScreen({Key? key}) : super(key: key);

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
        centerTitle: false,
        backgroundColor: AppTheme.backgroundColor,
        title: const Text("Transaction History", style: AppTheme.headingText18),
        elevation: 0,
      ),
      body: Padding(
        padding: AppTheme.pagePadding,
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
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
      ),
    );
  }
}
