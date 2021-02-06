import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/presentation/custom/custom_button.dart';
import 'package:flutter_application_1/presentation/custom/editprofilepage.dart';
import 'package:flutter_application_1/presentation/login_screen.dart';
import 'package:flutter_application_1/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/utils/string_values.dart';
import 'package:flutter_application_1/utils/global.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  User profile;
  bool page;
  Profile({this.profile, this.page});

  @override
  _ProfileState createState() => _ProfileState(profile, page);
}

class _ProfileState extends State<Profile> {
  User profile;
  bool page;
  _ProfileState(this.profile, this.page);

  _navigateToLoginPage() {
    Navigator.popAndPushNamed(context, LoginPage.routeNamed);
  }

  _getProfile() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Styles.DARK_GRAYBROWN, Styles.COFFEE]),
            ),
            child: Container(
              width: double.infinity,
              height: ScreenUtil.instance.setHeight(325.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          elevation: 5.0,
                          color: Styles.GRAY_BROWN,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3.0, horizontal: 15.0),
                            child: Text(
                              profile.follower.toString(),
                              style: TextStyle(
                                  color: Styles.WHITE,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Text(
                          Strings.FOLLOWERS,
                          style: TextStyle(color: Styles.WHITE),
                        ),
                      ],
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          SizedBox(height: ScreenUtil.instance.setHeight(30)),
                          CircleAvatar(
                            radius: 70,
                            backgroundColor: Styles.PRIMARY_CREAM,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                profile.image,
                              ),
                              radius: 67.0,
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil.instance.setHeight(12.0),
                          ),
                          Text(
                            profile.name,
                            style:
                                TextStyle(fontSize: 27.0, color: Styles.WHITE),
                          ),
                          Text(
                            profile.email,
                            style:
                                TextStyle(fontSize: 16.0, color: Styles.WHITE),
                          ),
                        ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          elevation: 5.0,
                          color: Styles.GRAY_BROWN,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3.0, horizontal: 15.0),
                            child: Text(
                              profile.following.toString(),
                              style: TextStyle(
                                  color: Styles.WHITE,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Text(
                          Strings.FOLLOWING,
                          style: TextStyle(color: Styles.WHITE),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Styles.PRIMARY_CREAM,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      profile.bio,
                      style:
                          TextStyle(height: ScreenUtil.instance.setHeight(1.6)),
                      textAlign: TextAlign.justify,
                    )
                  ],
                )),
          ),
          Container(
            padding: EdgeInsets.only(top: 1.5),
            color: Styles.GRAY_BROWN,
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 1.5,
              mainAxisSpacing: 1.5,
              children: <Widget>[
                Container(
                  color: Styles.PRIMARY_CREAM,
                  child: IconButton(
                      icon: Icon(
                        Icons.phone_in_talk,
                        size: ScreenUtil.instance.setHeight(52),
                        color: Styles.DARK_TAN,
                      ),
                      onPressed: () {}),
                ),
                Container(
                  color: Styles.PRIMARY_CREAM,
                  child: IconButton(
                      icon: Icon(
                        Icons.chat,
                        size: ScreenUtil.instance.setHeight(52),
                        color: Styles.DARK_TAN,
                      ),
                      onPressed: () {}),
                ),
                Container(
                  color: Styles.PRIMARY_CREAM,
                  child: IconButton(
                      icon: Icon(
                        Icons.mail,
                        size: ScreenUtil.instance.setHeight(52),
                        color: Styles.DARK_TAN,
                      ),
                      onPressed: () {}),
                ),
                Container(
                  color: Styles.PRIMARY_CREAM,
                  child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.facebook,
                        size: ScreenUtil.instance.setHeight(52),
                        color: Styles.DARK_TAN,
                      ),
                      onPressed: () {}),
                ),
                Container(
                  color: Styles.PRIMARY_CREAM,
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.linkedin,
                      size: ScreenUtil.instance.setHeight(52),
                      color: Styles.DARK_TAN,
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  color: Styles.PRIMARY_CREAM,
                  child: IconButton(
                      icon: Icon(
                        Icons.edit,
                        size: ScreenUtil.instance.setHeight(52),
                        color: Styles.DARK_TAN,
                      ),
                      onPressed: () {
                        setState(() {
                          editt = true;
                        });
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: CustomButton(
                containerColor: Styles.COFFEE,
                labelText: 'Log Out',
                isLoading: false,
                onTap: () async {
                  bool sign = await firebaseAuthService.signOut();
                  if (sign)
                    _navigateToLoginPage();
                  else
                    showSnackbar(Strings.PROBLEM_IN_LOGOUT, context);
                }),
          )
        ],
      ),
    );
  }

  _getEditProfile() {
    return Expanded(
      child: ListView(
          padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 35.0),
          children: [
            Text(
              'Edit Profile',
              style: TextStyle(
                  color: Styles.DARK_GRAYBROWN,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: ScreenUtil.instance.setHeight(20)),
            CircleAvatar(
              radius: 70,
              backgroundColor: Styles.TAN,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://i.insider.com/551705a769bedda110343a79?width=1080&format=jpeg",
                ),
                radius: 67.0,
              ),
            ),
            MyEditForm()
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (editt == false) {
      child = _getProfile();
    } else {
      child = _getEditProfile();
    }

    return Scaffold(
        backgroundColor: Styles.PRIMARY_CREAM,
        body: Column(
          children: <Widget>[child],
        ));
  }
}
