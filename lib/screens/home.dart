import 'package:flutter/material.dart';
import 'package:jade/screens/feed.dart';
import 'package:jade/services/auth.dart';
import 'package:jade/screens/signup.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("ERR: Failed to authenticate user"),
          );
        } else if (snapshot.hasData && AuthService().user!.emailVerified) {
            return const FeedScreen();
        } else {
          return const SignUpScreen();
        }
      }
    );
  }
}
