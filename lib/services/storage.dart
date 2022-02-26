import 'package:firebase_storage/firebase_storage.dart';
import 'dart:typed_data';
import 'auth.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    // creating location to our firebase storage

    Reference ref =
        _storage.ref().child(childName).child(AuthService().user!.uid);

    // putting in uint8list format -> Upload task like a future but not future
    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
