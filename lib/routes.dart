import 'package:jade/screens/feed.dart';
import 'package:jade/screens/email_login.dart';
import 'package:jade/screens/email_signup.dart';
import 'package:jade/screens/landing.dart';
import 'package:jade/screens/profile_setup.dart';
import 'package:jade/screens/verify_email.dart';

var appRoutes = {
  '/signup' : (context) => const LandingScreen(),
  '/feed' : (context) => const FeedScreen(),
  '/email_signup' : (context) => EmailSignUpScreen(),
  '/email_login' : (context) => const EmailLoginScreen(),
  '/profile_setup' : (context) => ProfileSetupScreen(),
  '/verify_email' : (context) => const VerifyEmailScreen(),
};