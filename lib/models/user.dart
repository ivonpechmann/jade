import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? email;
  final String uid;
  final String username;
  final String displayName;
  final String bio;
  final String profilePicURL;
  final List followers;
  final List following;

  const User(
      {required this.username,
      required this.displayName,
      required this.uid,
      required this.email,
      required this.bio,
      required this.profilePicURL,
      required this.followers,
      required this.following});

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot["username"],
      displayName: snapshot["displayName"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      bio: snapshot["bio"],
      profilePicURL: snapshot["profilePicURL"],
      followers: snapshot["followers"],
      following: snapshot["following"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "displayName": displayName,
        "uid": uid,
        "email": email,
        "bio": bio,
        "profilePicURL" : profilePicURL,
        "followers": followers,
        "following": following,
  };
}