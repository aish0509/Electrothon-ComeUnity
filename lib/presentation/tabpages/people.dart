import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/presentation/custom/custom_scaffold.dart';

import 'package:flutter_application_1/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/utils/string_values.dart';
import 'package:flutter_application_1/utils/global.dart';

class People extends StatefulWidget {
  User peop;

  People({this.peop});

  @override
  _PeopleState createState() => _PeopleState(peop);
}

class _PeopleState extends State<People> {
  User peop;

  _PeopleState(this.peop);

  @override
  void initState() {
    print(peop.name);
    super.initState();
  }

  _getPeople() {
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
                              peop.follower.toString(),
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
                                peop.image,
                              ),
                              radius: 67.0,
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil.instance.setHeight(12.0),
                          ),
                          Text(
                            peop.name,
                            style:
                                TextStyle(fontSize: 27.0, color: Styles.WHITE),
                          ),
                          Text(
                            peop.email,
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
                              peop.following.toString(),
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
                      peop.bio,
                      style:
                          TextStyle(height: ScreenUtil.instance.setHeight(1.6)),
                      textAlign: TextAlign.justify,
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }

  _getEditPeople() {
    return Expanded(
      child: ListView(
          padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 35.0),
          children: [
            Text(
              'Edit People',
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
          ]),
    );
  }

  bool k = false;
  @override
  Widget build(BuildContext context) {
    Widget child;
    if (k == false) {
      child = _getPeople();
    } else {
      child = _getEditPeople();
    }

    return CustomScaffold(
        appbarOnTap: () {
          Navigator.pop(context);
        },
        appBarText: "",
        body: Column(
          children: <Widget>[child],
        ));
  }
}
