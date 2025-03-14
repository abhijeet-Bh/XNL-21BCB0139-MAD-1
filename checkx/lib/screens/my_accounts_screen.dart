import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../components/credit_card.dart';
import '../components/primary_button.dart';
import '../models/user-model.dart';
import '../utils/app_theme.dart';

class MyAccountsScreen extends ConsumerWidget {
  static const String routeName = "/my-accounts";

  const MyAccountsScreen({Key? key}) : super(key: key);

  Future<List<BankAccount>> _loadAccounts() async {
    var userBox = await Hive.openBox<UserModel>('userBox');
    UserModel? user = userBox.get('user');
    return user?.accounts ?? [];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppTheme.backgroundColor,
        title: const Text("My Accounts", style: AppTheme.headingText18),
        elevation: 0,
      ),
      body: FutureBuilder<List<BankAccount>>(
        future: _loadAccounts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final accounts = snapshot.data ?? [];

          return Padding(
            padding: AppTheme.pagePadding,
            child: Column(
              children: [
                if (accounts.isEmpty)
                  const Center(child: Text("No accounts found"))
                else
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: accounts.length,
                    itemBuilder: (context, index) {
                      final account = accounts[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 14.0),
                        child: CreditCard(
                          bankName: account.bankName,
                          accountNumber: account.accountNumber,
                          balance: account.balance,
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
          );
        },
      ),
    );
  }
}
