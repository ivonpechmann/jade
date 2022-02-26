import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jade/services/auth.dart';
import 'package:jade/shared/top_bar.dart';
import 'package:jade/theme.dart';

class EmailLoginScreen extends StatefulWidget {
  const EmailLoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: Form(
        key: _formKey,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Username or Email'),
                  validator: (String? value) {
                    if (value!.isEmpty) return 'Please enter some text';
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (String? value) {
                    if (value!.isEmpty) return 'Please enter some text';
                    return null;
                  },
                  obscureText: true,
                ),
                TextButton(
                  onPressed: _resetPassword,
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  alignment: Alignment.center,
                  child: SignInButtonBuilder(
                    icon: Icons.email,
                    backgroundColor: purpleColor,
                    text: 'Sign In',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await _signInWithEmailAndPassword();
                      }
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    _errorMessage!,
                    style: errorMessage,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _signInWithEmailAndPassword() async {
    try {
      User? user = (await AuthService().auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )).user;
      if (user != null) {
        if (user.emailVerified && await AuthService().profileExists()) {
          Navigator.pushNamedAndRemoveUntil(context, '/feed', (route) => false);
        } else if (!(await AuthService().profileExists()) && user.emailVerified){
          Navigator.pushNamedAndRemoveUntil(context, '/profile_setup', (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(context, '/verify_email', (route) => false);
        }
      } else {
        setState(() {
          _errorMessage = "Sign in failed for an unknown reason. Please try again.";
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }

  Future _resetPassword() async {
    String? email;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _errorMessage = 'Check email to reset password.';
                });
                Navigator.of(context).pop();
              },
              child: const Text('Send'),
            ),
          ],
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Enter your email'),
              const SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  email = value;
                },
              ),
            ],
          ),
        );
      },
    );

    if (email != null) {
      try {
        await AuthService().auth.sendPasswordResetEmail(email: email!);
      } catch (e) {
        setState(() {
          _errorMessage = 'Please enter a valid email.';
        });
      }
    } 
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

}