import 'dart:typed_data';
import 'package:jade/models/user.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;
  final userStream = FirebaseAuth.instance.authStateChanges();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<String> createUser({
    required String username,
    required String displayName,
    required String bio,
  }) async {
    String res = "Some error Occurred";
    try {
      if (username.isNotEmpty &&
          bio.isNotEmpty &&
          displayName.isNotEmpty) {
        model.User _user = model.User(
          username: username,
          displayName: displayName,
          email: user!.email,
          uid: user!.uid,
          bio: bio,
          followers: [],
          following: [],
        );
        await _firestore.collection("users").doc(user!.uid).set(_user.toJson());
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }
}
