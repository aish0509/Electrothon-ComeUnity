import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  static const String routeNamed = 'auth';
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  FirebaseUser user;
  bool checker = true;

  @override
  void initState() {
    super.initState();
    check();
  }

  check() async {
    user = await firebaseAuthService.getCurrentuser();
    if (user != null) await userService.getData();
    setState(() {
      checker = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body: Container(child: Builder(builder: (BuildContext context) {
      if (checker)
        return Center(
          child: CircularProgressIndicator(),
        );

      return (user == null) ? LoginPage() : SplashPage();
    }))));
  }
}
