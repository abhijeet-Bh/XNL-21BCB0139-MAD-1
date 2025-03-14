import 'package:checkx/screens/ammount-screen.dart';
import 'package:checkx/utils/app_theme.dart';
import 'package:flutter/material.dart';

class UserSearchBottomSheet extends StatefulWidget {
  const UserSearchBottomSheet({super.key});

  @override
  _UserSearchBottomSheetState createState() => _UserSearchBottomSheetState();
}

class _UserSearchBottomSheetState extends State<UserSearchBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> recentUsers = [];

  @override
  void initState() {
    super.initState();
    _loadRecentUsers();
  }

  void _loadRecentUsers() {
    // Dummy recent users (Replace with Firestore query)
    setState(() {
      recentUsers = [
        {
          "name": "Rahul Sharma",
          "id": "rahul@checkx",
          "avatar": "https://randomuser.me/api/portraits/men/1.jpg"
        },
        {
          "name": "Neha Kapoor",
          "id": "neha@checkx",
          "avatar": "https://randomuser.me/api/portraits/women/2.jpg"
        },
      ];
    });
  }

  void _searchUsers(String query) {
    // Implement Firebase Firestore search here
  }

  void _navigateToPayment(String userId) {
    Navigator.pushNamed(context, "/payment", arguments: {"userId": userId});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Search Bar
          TextField(
            controller: _searchController,
            onChanged: _searchUsers,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search, color: Colors.white),
              hintText: "Search users...",
              filled: true,
              fillColor: Colors.white.withOpacity(0.2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide.none,
              ),
            ),
            style:
                AppTheme.labelTextLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Recent Users List
          Expanded(
            child: ListView.builder(
              itemCount: recentUsers.length,
              itemBuilder: (context, index) {
                final user = recentUsers[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user["avatar"]!),
                  ),
                  title: Text(user["name"]!,
                      style: const TextStyle(color: Colors.white)),
                  subtitle: Text(user["id"]!,
                      style: const TextStyle(color: Colors.white70)),
                  // onTap: () => _navigateToPayment(user["id"]!),
                  onTap: () => Navigator.pushNamed(
                    context,
                    EnterAmountScreen.routeName,
                    arguments: {
                      'userId': 'abhijeet@checkx',
                      'userName': 'Abhijeet Bhardwaj'
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
