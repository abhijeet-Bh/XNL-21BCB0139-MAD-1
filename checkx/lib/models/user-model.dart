import 'package:hive/hive.dart';

part 'user-model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String firstName;

  @HiveField(2)
  final String lastName;

  @HiveField(3)
  final String transactionPin;

  @HiveField(4)
  final List<BankAccount> accounts;

  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.transactionPin,
    required this.accounts,
  });
}

@HiveType(typeId: 1)
class BankAccount {
  @HiveField(0)
  final String accountNumber;

  @HiveField(1)
  double balance;

  @HiveField(2)
  final String bankName;

  BankAccount({
    required this.accountNumber,
    required this.balance,
    required this.bankName,
  });
}
