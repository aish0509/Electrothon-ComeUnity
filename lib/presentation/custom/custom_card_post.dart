import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/post.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/utils/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomPost extends StatelessWidget {
  Post post;
  List<User> userList;
  Function onTap;
  CustomPost({this.post, this.userList, this.onTap});

  @override
  Widget build(BuildContext context) {
    User user = null;
    for (int i = 0; i < userList.length; i++) {
      print(userList[i].name);
      if (post.by == userList[i].uid) {
        user = userList[i];
        break;
      }
    }

    return (user != null)
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
            child: Card(
              elevation: 5.0,
              shadowColor: Styles.DARK_GRAYBROWN,
              color: Styles.PRIMARY_CREAM,
              margin: EdgeInsets.all(5),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(user.image),
                        radius: 15.0,
                      ),
                      SizedBox(
                        width: ScreenUtil.instance.setWidth(10.0),
                      ),
                      Text(
                        user.name,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: ScreenUtil.instance.setWidth(125),
                      ),
                      IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.solidComments,
                            color: Styles.DARK_GRAYBROWN,
                          ),
                          onPressed: onTap)
                    ]),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Image(
                        image: NetworkImage(post.image),
                      ),
                    ),
                    Container(
                      child: Text(
                        post.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.0,
                            wordSpacing: 2.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(5),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        post.desc,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          wordSpacing: 2.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}
