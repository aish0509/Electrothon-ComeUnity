import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/comments.dart';
import 'package:flutter_application_1/models/post.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/presentation/custom/custom_button.dart';
import 'package:flutter_application_1/presentation/custom/custom_card_post.dart';
import 'package:flutter_application_1/presentation/login_screen.dart';
import 'package:flutter_application_1/presentation/splashpage.dart';
import 'package:flutter_application_1/utils/global.dart';
import 'package:flutter_application_1/utils/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User userData;
  List<Post> postList = List<Post>();
  List<User> userList = List<User>();
  List<Comment> commentList = List<Comment>();
  bool isloading = false;
  bool isCommentLoading = false;
  String comer = "";

  @override
  void initState() {
    getPostAndUserAndComment();
    super.initState();
  }

  getPostAndUserAndComment() async {
    setState(() {
      isloading = true;
    });
    postList = await postService.getData();
    userList = await userService.getUserList();
    commentList = await commentService.getData();
    setState(() {
      isloading = false;
    });
  }

  _navigateToLoginPage() {
    Navigator.popAndPushNamed(context, LoginPage.routeNamed);
  }

  void _bottomSheet(
      BuildContext context, List<CommentShow> commenter, Post post) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              padding: EdgeInsets.symmetric(
                vertical: ScreenUtil.instance.setWidth(8),
              ),
              decoration: BoxDecoration(color: Styles.CREAM, boxShadow: [
                BoxShadow(
                    color: Styles.COFFEE.withOpacity(.1),
                    blurRadius: 3,
                    offset: Offset(0, 5))
              ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Comments',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(16),
                    ),
                    Builder(builder: (BuildContext context) {
                      return Column(children: [
                        for (int i = 0; i < commenter.length; i++)
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Styles.COFFEE,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Styles.COFFEE,
                                          blurRadius: 4,
                                          offset: Offset(0, 0))
                                    ]),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  commenter[i].userImage),
                                              radius: 15.0,
                                            ),
                                            SizedBox(
                                              width: ScreenUtil.instance
                                                  .setWidth(10.0),
                                            ),
                                            Text(
                                              commenter[i].userName,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16, right: 16, bottom: 16),
                                        child: Text(
                                          commenter[i].comment,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ]),
                              ))
                      ]);
                    }),
                    TextField(
                      minLines: 1,
                      keyboardType: TextInputType.multiline,
                      onChanged: (v) {
                        comer = v;
                      },
                      maxLines: null,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                BorderSide(color: Styles.COFFEE, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                BorderSide(color: Styles.COFFEE, width: 2)),
                        hintText: 'Description',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      child: CustomButton(
                          labelText: 'Add Comment',
                          isLoading: isCommentLoading,
                          onTap: () async {
                            print(comer);
                            if (comer == "") {
                              showToast(msg: "Write something in comment");
                            } else {
                              print(mainUser.uid);
                              print(post.uid);
                              setState(() {
                                isCommentLoading = true;
                              });
                              Comment co = Comment(
                                  comment: comer,
                                  userId: mainUser.uid,
                                  postId: post.uid);
                              await commentService.uploadComment(comments: co);
                              setState(() {
                                isCommentLoading = false;
                              });

                              currentPage = 0;
                              Navigator.pushNamed(
                                  context, SplashPage.routeNamed);
                            }
                          }),
                    )
                  ],
                )),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.CREAM,
        body: (isloading == false)
            ? Container(
                height:
                    ScreenUtil.instance.setHeight(ScreenUtil.instance.height),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: postList.length,
                    itemBuilder: (context, i) {
                      return CustomPost(
                          post: postList[i],
                          userList: userList,
                          onTap: () async {
                            List<CommentShow> commenter = List<CommentShow>();
                            commenter = await commentService.getComment(
                                postList[i], userList, commentList);
                            _bottomSheet(context, commenter, postList[i]);
                          });
                    }))
            : Container(child: Center(child: CircularProgressIndicator())));
  }
}
