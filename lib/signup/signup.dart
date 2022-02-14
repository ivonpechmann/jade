import 'package:flutter/material.dart';
import 'package:jade/services/auth.dart';
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
            const SizedBox(
              height: 90,
            ),
            Text(
              "Express yourself.",
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 60,
            ),
            SignInButtonBuilder(
                backgroundColor: grayColor,
                icon: Icons.email,
                onPressed: () {
                  Navigator.pushNamed(context, '/email_signup');
                },
                text: "Use Email"),
            SignInButton(
              Buttons.GoogleDark,
              text: "Continue with Google",
              onPressed: () {
                AuthService().signInWithGoogle();
                if (AuthService().user != null) {
                  Navigator.pushNamedAndRemoveUntil(context, '/feed', (route) => false);
                }
              },
            ),
            SignInButton(Buttons.Apple,
                text: "Continue with Apple", onPressed: () {}),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text("Already have an account? ",
                style: Theme.of(context).textTheme.bodyText1),
            padding: const EdgeInsets.symmetric(vertical: 35),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/email_login'),
            child: Container(
              child: Text(
                "Log in.",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              padding: const EdgeInsets.symmetric(vertical: 35),
            ),
          )
        ],
      ),
    );
  }
}
