import 'package:flutter/material.dart';
import 'package:jade/shared/top_bar.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:jade/theme.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: Container(
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Sign up for Jade",
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 60,
            ),
            SignInButtonBuilder(
                backgroundColor: grayColor,
                icon: Icons.email,
                onPressed: () {},
                text: "Use Email"),
            SignInButtonBuilder(
              backgroundColor: grayColor,
              icon: Icons.phone,
              onPressed: () {},
              text: "Use Phone",
            ),
            SignInButton(
              Buttons.GoogleDark,
              text: "Continue with Google",
              onPressed: () {},
            ),
            SignInButton(Buttons.Apple,
                text: "Continue with Apple", onPressed: () {}),
            SignInButton(Buttons.Facebook,
                text: "Continue with Facebook", onPressed: () {}),
            SignInButton(Buttons.Twitter,
                text: "Continue with Twitter", onPressed: () {}),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "Already have an account? ",
              style: Theme.of(context).textTheme.bodyText1
            ),
            padding: const EdgeInsets.symmetric(vertical: 35),
          ),
          Container(
            child: Text(
              "Log in.",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            padding: const EdgeInsets.symmetric(vertical: 35),
          )
        ],
      ),
    );
  }
}
