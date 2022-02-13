import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:jade/services/auth.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      constraints: const BoxConstraints(maxHeight: 30),
      alignment: Alignment.center,
      child: SignInButtonBuilder(
        backgroundColor: Colors.blueGrey,
        onPressed: () async {
          await AuthService().auth.signOut();
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },
        text: "Log Out",
      )
    );
  }
}