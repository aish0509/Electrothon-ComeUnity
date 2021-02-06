import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/services/comment_services.dart';
import 'package:flutter_application_1/services/firebase_auth_service.dart';
import 'package:flutter_application_1/services/model_services.dart';
import 'package:flutter_application_1/services/post_services.dart';
import 'package:flutter_application_1/services/upload_file_firebase.dart';
import 'package:flutter_application_1/services/user_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

double defaultHeight = 896;
double defaultWidth = 414;
int currentPage = 0;
bool editt = false;
FirebaseUser mainUser;

User userData;



final UploadFileFirebase uploadFileFirebase = UploadFileFirebase.getInstance();
final FirebaseAuthService firebaseAuthService =
    FirebaseAuthService.getInstance();
final UserService userService = UserService.getInstance();
final PostService postService = PostService.getInstance();
final CommentService commentService = CommentService.getInstance();
final ModeService modeService = ModeService.getInstance();

Widget showSnackbar(
  String text,
  BuildContext context,
) {
  if (context != null) {
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            text,
          ),
          backgroundColor: Colors.black,
          duration: Duration(milliseconds: 2500),
        ),
      );
  } else {
    return SizedBox();
  }
}



showToast({String msg}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      textColor: Colors.black,
      fontSize: 16.0);
}