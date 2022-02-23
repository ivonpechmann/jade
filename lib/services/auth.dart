import 'package:jade/models/user.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;
  final userStream = FirebaseAuth.instance.authStateChanges();
  final _firestore = FirebaseFirestore.instance;

  Future<bool> userExists() async {
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(user!.uid).get();
    if (documentSnapshot.exists) {
      return true;
    }
    return false;
  }

  Future<model.User> getUserDetails() async {
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(user!.uid).get();
    
    return model.User.fromSnap(documentSnapshot);
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<String> createUser({
    required String username,
    required String displayName,
  }) async {
    String res = "Some error Occurred";
    try {
      if (username.isNotEmpty && displayName.isNotEmpty) {
        model.User _user = model.User(
          username: username,
          displayName: displayName,
          email: user!.email,
          uid: user!.uid,
          bio: '',
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
