import 'package:hive/hive.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 2)
class TransactionModel {
  @HiveField(0)
  final String txnId;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String subtitle;

  @HiveField(3)
  final double amount;

  @HiveField(4)
  final bool isIncome;

  @HiveField(5)
  final String iconPath;

  @HiveField(6)
  final String payId;

  @HiveField(7)
  final String dateTime;

  TransactionModel({
    required this.txnId,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.isIncome,
    required this.iconPath,
    required this.payId,
    required this.dateTime,
  });
}
