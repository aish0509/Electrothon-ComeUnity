import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/utils/global.dart';

class UserService {
  UserService._();

  factory UserService.getInstance() => _instance;
  static final UserService _instance = UserService._();
  Firestore _firestore = Firestore.instance;

  Future<void> getData() async {
    try {
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('users').document(mainUser.uid).get();
      if (documentSnapshot.data == null) {
        await _firestore.collection('users').document(mainUser.uid).setData({
          "uid": mainUser.uid,
          "email": mainUser.email,
          "name": mainUser.displayName,
          "image": mainUser.photoUrl,
          "bio":"",
          "skills": [],
          "links": [],
          "follower": 0,
          "following": 0
        });

        userData = User(
            uid: mainUser.uid,
            email: mainUser.email,
            name: mainUser.displayName,
            image: mainUser.photoUrl,
            skills: [],
            links: [],
            bio:"",
            follower : 0,
            following: 0);
      } else {
        userData = User(
            uid: documentSnapshot.data["uid"],
            email: documentSnapshot.data["email"],
            name: documentSnapshot.data["name"],
            image:documentSnapshot.data["image"] ,
            skills: documentSnapshot.data["skills"]  ,
            links: documentSnapshot.data["links"]  ,
            follower: documentSnapshot.data["follower"],
            following: documentSnapshot.data["following"],
            bio: documentSnapshot.data["bio"] );
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  
  Future<List<User>>  getUserList() async
  {
      List<User> userList = List<User>();

        QuerySnapshot querySnapshot = await _firestore.collection('users').getDocuments();
            for (int i = 0; i < querySnapshot.documents.length; i++) {
            DocumentSnapshot documentSnapshot = querySnapshot.documents[i];
            if(documentSnapshot.data!=null)
              {
            User users = User(
            uid: documentSnapshot.data["uid"],
            email: documentSnapshot.data["email"],
            name: documentSnapshot.data["name"],
            image:documentSnapshot.data["image"] ,
            skills: documentSnapshot.data["skills"]  ,
            links: documentSnapshot.data["links"]  ,
            follower: documentSnapshot.data["follower"],
            following: documentSnapshot.data["following"],
            bio: documentSnapshot.data["bio"] );
            userList.add(users);
              }
            }
  return userList;
  }

}
