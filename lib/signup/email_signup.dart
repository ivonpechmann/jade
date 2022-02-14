import 'package:flutter/material.dart';
import 'package:jade/shared/top_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:jade/services/auth.dart';
import 'package:jade/theme.dart';

class EmailSignUpScreen extends StatefulWidget {
  EmailSignUpScreen({Key? key}) : super(key: key);

  @override
  State<EmailSignUpScreen> createState() => _EmailSignUpScreenState();
}

class _EmailSignUpScreenState extends State<EmailSignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool? _success;
  String? _errorMessage;

  Future<void> _register() async {
    try {
      final User? user =
          (await AuthService().auth.createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  ))
              .user;
      if (user != null) {
        setState(() {
          _success = true;
        });
        Navigator.pushNamedAndRemoveUntil(context, '/verify_email', (route) => false);
      } else {
        setState(() {
          _success = false;
          _errorMessage =
              "Registration failed for unknown reason. Please try again.";
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _success = false;
        _errorMessage = e.message;
      });
    } catch (e) {
      setState(() {
        _success = false;
        _errorMessage = e.toString();
      });
    }
  }

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
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  obscureText: true,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  child: SignInButtonBuilder(
                    icon: Icons.person_add,
                    backgroundColor: purpleColor,
                    onPressed: () async {
                      await _register();
                    },
                    text: 'Sign Up',
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    _success == null
                    ? ''
                    : (_success! ? '' : _errorMessage!),
                  style: const TextStyle(color: Colors.red),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
