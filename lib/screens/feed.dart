import 'package:flutter/material.dart';
import 'package:jade/services/auth.dart';
import 'package:jade/shared/bottom_nav_bar.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(50),
        alignment: Alignment.center,
        child: TextButton(
          child: const Text(
            "Log Out.",
          ),
          onPressed: AuthService().signOut,
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
