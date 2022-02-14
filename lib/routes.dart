import 'package:jade/feed/feed.dart';
import 'package:jade/login/email_login.dart';
import 'package:jade/signup/email_signup.dart';
import 'package:jade/signup/set_username.dart';
import 'package:jade/signup/signup.dart';
import 'package:jade/signup/verify_email.dart';

var appRoutes = {
  '/signup' : (context) => const SignUpScreen(),
  '/feed' : (context) => const FeedScreen(),
  '/email_signup' : (context) => EmailSignUpScreen(),
  '/email_login' : (context) => const EmailLoginScreen(),
  '/set_username' : (context) => SetUsernameScreen(),
  '/verify_email' : (context) => const VerifyEmailScreen(),
};