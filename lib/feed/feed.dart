import 'package:flutter/material.dart';
import 'package:jade/services/auth.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      constraints: const BoxConstraints(maxHeight: 30),
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          AuthService().signOut();
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },
        child: const Text('Log out'),
      )
    );
  }
}