import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/post.dart';
import 'package:flutter_application_1/utils/global.dart';
import 'dart:math';

Random random = new Random();

class PostService {
  PostService._();

  factory PostService.getInstance() => _instance;
  static final PostService _instance = PostService._();
  Firestore _firestore = Firestore.instance;

  Future<List<Post>> getData() async {
    try {
      List<Post> postList = List<Post>();

      QuerySnapshot querySnapshot =
          await _firestore.collection('posts').getDocuments();

      for (int i = 0; i < querySnapshot.documents.length; i++) {
        DocumentSnapshot documentSnapshot = querySnapshot.documents[i];
        if (documentSnapshot.data != null) {
          Post post = Post(
              uid: documentSnapshot.documentID,
              by: documentSnapshot.data["by"],
              desc: documentSnapshot.data["desc"],
              image: documentSnapshot.data["image"],
              time: documentSnapshot.data["timeStamp"].toString(),
              title: documentSnapshot.data["title"]);
          postList.add(post);
        }
      }
      return postList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  uploadingImage({File imageFile, String uid}) async {
    try {
      if (imageFile != null) {
        String url = await uploadFileFirebase.uploadFile(
            file: imageFile, folderName: 'posts', fileName: uid);
        return url;
      }
      return null;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> uploadPost({Post post}) async {
    try {
      String value = random.nextInt(10000000).toString();
      await _firestore.collection('posts').document(value).setData({
        "by": userData.uid,
        "desc": post.desc,
        "image": post.image,
        "timeStamp": "",
        "title": post.title,
        "uid": value
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
