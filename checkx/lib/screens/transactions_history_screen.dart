import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/transaction_card.dart';
import '../components/transaction_details_sheet.dart';
import '../providers/transaction_provider.dart';
import '../utils/app_theme.dart';

class TransactionsHistoryScreen extends ConsumerWidget {
  static const String routeName = "/transactions-history";

  const TransactionsHistoryScreen({Key? key}) : super(key: key);

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
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionsProvider);

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppTheme.backgroundColor,
        title: const Text("Transaction History", style: AppTheme.headingText18),
        elevation: 0,
      ),
      body: Padding(
        padding: AppTheme.pagePadding,
        child: transactions.isEmpty
            ? const Center(child: Text("No transactions found"))
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return GestureDetector(
                    onTap: () => _showTransactionDetails(
                      context,
                      transaction.amount,
                      transaction.txnId,
                      transaction.dateTime,
                      transaction.title,
                      transaction.payId,
                    ),
                    child: TransactionCard(
                      title: transaction.title,
                      subtitle: transaction.subtitle,
                      amount: transaction.amount,
                      isIncome: transaction.isIncome,
                      iconPath: transaction.iconPath,
                    ),
                  );
                },
              ),
      ),
    );
  }
}
