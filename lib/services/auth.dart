import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final auth = FirebaseAuth.instance;
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;
}

