import 'package:jade/models/user.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:jade/services/storage.dart';

class AuthService {
  final auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;
  final userStream = FirebaseAuth.instance.authStateChanges();
  final _firestore = FirebaseFirestore.instance;

  Future<bool> profileExists() async {
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(user!.uid).get();
    if (documentSnapshot.exists) {
      return true;
    }
    return false;
  }

  Future<bool> usernameTaken(String username) async {
    QuerySnapshot result = await _firestore.collection('users').where('username'.toLowerCase(), isEqualTo: username.toLowerCase()).get();
    final List<DocumentSnapshot> documents = result.docs;
    if (documents.isNotEmpty) {
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
    required File? profilePic,
  }) async {
    String res = "Some error Occurred";
    String ppURL;

    try {
      if (profilePic == null) {
        ppURL = "default";
      } else {
        ppURL = await StorageService().uploadImageToStorage('profilePics', profilePic);
      }
      
      if (username.isNotEmpty && displayName.isNotEmpty && !(await usernameTaken(username))) {
        model.User _user = model.User(
          username: username,
          displayName: displayName,
          email: user!.email,
          uid: user!.uid,
          bio: '',
          profilePicURL: ppURL,
          followers: [],
          following: [],
        );
        await _firestore.collection("users").doc(user!.uid).set(_user.toJson());
        res = "success";
      } else if (await usernameTaken(username)) {
        res = "Username is taken";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }
}
