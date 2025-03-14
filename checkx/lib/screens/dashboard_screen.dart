import 'package:checkx/screens/home_screen.dart';
import 'package:checkx/utils/app_theme.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = "/dashboard";
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/payment");
        },
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.payment, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: ClipRect(
        child: Padding(
          padding: const EdgeInsets.only(right: 62.0, top: 12),
          child: BottomNavigationBar(
            selectedIconTheme: const IconThemeData(
              color: AppTheme.whiteText,
            ),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), label: "Transactions"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance), label: "My Accounts"),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: AppTheme.whiteText,
            unselectedItemColor: AppTheme.accent,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
