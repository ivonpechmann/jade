import 'package:flutter/material.dart';
import 'package:jade/shared/top_bar.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TopBar(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Sign up for Jade."),
              SignInButtonBuilder(
                  backgroundColor: Color.fromARGB(156, 54, 54, 54),
                  icon: Icons.email,
                  onPressed: () {},
                  text: "Use Email")
            ],
          ),
        ));
  }
}
