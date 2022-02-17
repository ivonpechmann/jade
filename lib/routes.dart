import 'package:jade/screens/feed.dart';
import 'package:jade/screens/email_login.dart';
import 'package:jade/screens/email_signup.dart';
import 'package:jade/screens/set_username.dart';
import 'package:jade/screens/signup.dart';
import 'package:jade/screens/verify_email.dart';

var appRoutes = {
  '/signup' : (context) => const SignUpScreen(),
  '/feed' : (context) => const FeedScreen(),
  '/email_signup' : (context) => EmailSignUpScreen(),
  '/email_login' : (context) => const EmailLoginScreen(),
  '/set_username' : (context) => SetUsernameScreen(),
  '/verify_email' : (context) => const VerifyEmailScreen(),
};