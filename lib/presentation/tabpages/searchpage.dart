import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/presentation/custom/custom_profile_card.dart';
import 'package:flutter_application_1/presentation/tabpages/people.dart';
import 'package:flutter_application_1/utils/global.dart';
import 'package:flutter_application_1/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isLoading = true;
  List<User> userList = List<User>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  void getUserData() async {
    userList = await userService.getUserList();
    setState(() {
      isLoading = false;
    });
  }

  _navigatToPeople(User people) {
                                     Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>People(peop: people)),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.CREAM,
        body: Container(
            child: (isLoading)
                ? Container(child: Center(child: CircularProgressIndicator()))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: ScreenUtil.instance.setHeight(16),
                        ),
                        for (int i = 0; i < userList.length; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CustomProfileCard(
                              image: userList[i].image,
                              name: userList[i].name,
                              istrue: true,
                              imgh: 90,
                              imgw: 90,
                              number: userList[i].email,
                              onTap: () {
                                _navigatToPeople(userList[i]);
                              },
                            ),
                          )
                      ],
                    ),
                  )));
  }
}
