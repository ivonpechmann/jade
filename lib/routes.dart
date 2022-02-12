import 'package:jade/feed/feed.dart';
import 'package:jade/login/email_login.dart';
import 'package:jade/login/login.dart';
import 'package:jade/signup/email_signup.dart';
import 'package:jade/signup/signup.dart';

var appRoutes = {
  '/signup' : (context) => const SignUpScreen(),
  '/login' : (context) => const LoginScreen(),
  '/feed' : (context) => const FeedScreen(),
  '/email_signup' : (context) => EmailSignUpScreen(),
  '/email_login' : (context) => EmailLoginScreen(),
};