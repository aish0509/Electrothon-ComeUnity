import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/comments.dart';
import 'package:flutter_application_1/models/post.dart';
import 'package:flutter_application_1/models/user.dart';

class CommentService {
  CommentService._();

  factory CommentService.getInstance() => _instance;
  static final CommentService _instance = CommentService._();
  Firestore _firestore = Firestore.instance;

  Future<List<Comment>> getData() async {
    try {
      List<Comment> commentList = List<Comment>();

      QuerySnapshot querySnapshot =
          await _firestore.collection('comments').getDocuments();

      for (int i = 0; i < querySnapshot.documents.length; i++) {
        DocumentSnapshot documentSnapshot = querySnapshot.documents[i];
        if (documentSnapshot.data != null) {
          Comment comment = Comment(
            userId: documentSnapshot.data["userId"],
            postId: documentSnapshot.data["postId"],
            comment: documentSnapshot.data["comment"],
          );
          commentList.add(comment);
          print(commentList[i].postId);
        }
      }
      return commentList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> uploadComment({Comment comments}) async {
    try {
      await _firestore.collection('comments').document().setData({
        "userId": comments.userId,
        "postId": comments.postId,
        "comment": comments.comment,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<CommentShow>> getComment(
      Post post, List<User> userList, List<Comment> commentList) async {
    try {
      List<CommentShow> k = List<CommentShow>();

      for (int i = 0; i < commentList.length; i++) {
        {
          if (commentList[i].postId == post.uid) {
            for (int j = 0; j < userList.length; j++) {
              if (userList[j].uid == commentList[i].userId) {
                CommentShow p = CommentShow(
                    userImage: userList[j].image,
                    userName: userList[j].name,
                    comment: commentList[i].comment);
                print(p.comment);
                k.add(p);
              }
            }
          }
        }
        return k;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
