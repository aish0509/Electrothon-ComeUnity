import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class UploadFileFirebase {
  UploadFileFirebase._();

  factory UploadFileFirebase.getInstance() => _instance;
  static final UploadFileFirebase _instance = UploadFileFirebase._();
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadFile(
      {File file, String fileName, String folderName}) async {
    try {

      var snapshot = await _firebaseStorage
          .ref()
          .child('$folderName/$fileName')
          .putFile(file)
          .onComplete;
      var url = await snapshot.ref.getDownloadURL();

      return url;
    } catch (e) {
      print("in upload file to firebase service");
      print(e);
      throw e;
    }
  }
}
