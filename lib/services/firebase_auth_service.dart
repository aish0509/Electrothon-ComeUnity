import 'dart:async';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/utils/global.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  FirebaseAuthService._();

  static final FirebaseAuthService _instance = FirebaseAuthService._();

  factory FirebaseAuthService.getInstance() => _instance;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  Firestore _firestore = Firestore.instance;

  Future<FirebaseUser> handleSignIn() async {
    try {
      GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final AuthResult authResult =
          await _firebaseAuth.signInWithCredential(credential);

      mainUser = authResult.user;
      print("signed in " + mainUser.displayName);
      return mainUser;
    } catch (e) {
      print(e.toString());
      mainUser = null;
      return mainUser;
    }
  }

  Future<FirebaseUser> getCurrentuser() async {
    try {
      mainUser = await _firebaseAuth.currentUser();
      if (mainUser != null) {
        print("signed in " + mainUser.displayName);
        return mainUser;
      } else {
        return null;
      }
    } catch (e) {
      print("error");
      print(e);
      return null;
    }
  }

  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
      print("User Signed out");
      mainUser = null;
      userData = null;
      return true;
    } catch (e) {
      print("error in signout");
      print(e);
      return false;
    }
  }
}
