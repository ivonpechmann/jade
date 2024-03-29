import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jade/shared/top_bar.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {

  final _auth = FirebaseAuth.instance;
  User? user;
  Timer? timer;

  @override
  void initState() {
    user = _auth.currentUser;
    user!.sendEmailVerification();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) { 
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Verify Email',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'An email has been sent to ${user!.email}.',
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextButton(
                onPressed: user!.sendEmailVerification,
                child: const Text(
                  "Send email again.",
                  style: TextStyle(
                    color: Colors.blue
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = _auth.currentUser;
    await user!.reload();
    if (user!.emailVerified) {
      timer!.cancel();
      Navigator.pushNamedAndRemoveUntil(context, '/profile_setup', (route) => false);
    }
  }
}