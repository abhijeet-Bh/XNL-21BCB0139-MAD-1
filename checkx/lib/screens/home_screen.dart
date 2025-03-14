import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/credit_card.dart';
import '../components/transaction_card.dart';
import '../components/transaction_details_sheet.dart';
import '../models/transaction_model.dart';
import '../providers/transaction_provider.dart';
import '../providers/user_provider.dart';
import '../utils/app_theme.dart';

class HomeScreen extends ConsumerWidget {
  static const String routeName = "/home-screen";
  const HomeScreen({Key? key}) : super(key: key);

  void _showTransactionDetails(BuildContext context, TransactionModel txn) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.accent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return TransactionDetailsSheet(
          amount: txn.amount,
          txnId: txn.txnId,
          dateTime: txn.dateTime,
          name: txn.title,
          payId: txn.payId,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionsProvider);
    final user = ref.watch(userProvider);

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.backgroundColor,
        elevation: 0,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                  "https://cdn.pixabay.com/photo/2018/11/08/23/52/man-3803551_1280.jpg"),
            ),
            const SizedBox(width: 12),
            const Text("Hello, Abhijeet", style: AppTheme.headingText18),
            const Spacer(),
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
            const SizedBox(height: 14),

            // CREDIT CARD (Re-added)
            user == null
                ? const Center(child: CircularProgressIndicator())
                : user.accounts.isNotEmpty
                    ? CreditCard(
                        bankName: user.accounts[0].bankName,
                        accountNumber: user.accounts[0].accountNumber,
                        balance: user.accounts[0].balance,
                      )
                    : const Center(child: Text("No Bank Account Found")),

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

            // DYNAMIC TRANSACTIONS
            transactions.isEmpty
                ? const Center(
                    child: Text("No transactions found.",
                        style: AppTheme.labelTextMedium))
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final txn = transactions[index];
                      return GestureDetector(
                        onTap: () => _showTransactionDetails(context, txn),
                        child: TransactionCard(
                          title: txn.title,
                          subtitle: txn.subtitle,
                          amount: txn.amount,
                          isIncome: txn.isIncome,
                          iconPath: txn.iconPath,
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
