import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../main.dart';
import '../models/transaction_model.dart';
import '../models/user-model.dart';

final transactionsProvider =
    StateNotifierProvider<TransactionNotifier, List<TransactionModel>>((ref) {
  return TransactionNotifier();
});

class TransactionNotifier extends StateNotifier<List<TransactionModel>> {
  TransactionNotifier() : super([]) {
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    var txnBox = await Hive.openBox<TransactionModel>('transactionBox');
    state = txnBox.values.toList();
  }

  Future<void> addTransaction(TransactionModel transaction) async {
    var txnBox = await Hive.openBox<TransactionModel>('transactionBox');
    await txnBox.put(transaction.txnId, transaction);
    state = txnBox.values.toList();
  }

  Future<bool> processTransaction({
    required String senderId,
    required double amount,
  }) async {
    var userBox = await Hive.openBox<UserModel>('userBox');

    // Fetch sender
    UserModel? sender = userBox.get('user');
    if (sender == null) return false;

    // Find an account with sufficient balance
    BankAccount? senderAccount;
    for (var account in sender.accounts) {
      if (account.balance >= amount) {
        senderAccount = account;
        break;
      }
    }

    if (senderAccount == null) return false; // No sufficient balance

    // Deduct from sender
    senderAccount.balance -= amount;
    await userBox.put('user', sender);

    // Save transaction
    String txnId = DateTime.now().millisecondsSinceEpoch.toString();
    TransactionModel newTransaction = TransactionModel(
      txnId: txnId,
      title: "Debit Transaction",
      subtitle: "Spent ₹$amount",
      amount: amount,
      isIncome: false,
      iconPath: "assets/send_icon.png",
      payId: senderId,
      dateTime: DateTime.now().toString(),
    );

    await addTransaction(newTransaction);

    await _showTransactionNotification(amount);

    return true;
  }

  Future<void> _showTransactionNotification(double amount) async {
    const DarwinNotificationDetails iOSDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails platformDetails =
        NotificationDetails(iOS: iOSDetails);

    await notificationsPlugin.show(
      0,
      "Transaction Successful",
      "₹$amount deducted from your account",
      platformDetails,
    );
  }
}
