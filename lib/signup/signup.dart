import 'package:flutter/material.dart';
import 'package:jade/shared/top_bar.dart';
import 'package:jade/theme.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: Container(
        padding: const EdgeInsets.all(30),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 70,
            ),
            Text(
              "Express yourself.",
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 80,
            ),
            Column(children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/email_signup');
                },
                child: Text(
                  'Create account',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 70, vertical: 15)),
                  backgroundColor: MaterialStateProperty.all(purpleColor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    )
                  )
                )
              ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/email_login');
                },
                child: Text(
                  'Log in',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
