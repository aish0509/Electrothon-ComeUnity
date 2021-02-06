import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/custom/custom_button.dart';
import 'package:flutter_application_1/presentation/splashpage.dart';
import 'package:flutter_application_1/utils/global.dart';
import 'package:flutter_application_1/utils/string_values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  static const String routeNamed = 'LoginPage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseUser user;

  bool loading = false;

  _navigateToSplashPage() {
    Navigator.pushNamed(context, SplashPage.routeNamed);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
        height: defaultHeight, width: defaultWidth, allowFontScaling: false)
      ..init(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: ScreenUtil.instance.setHeight(ScreenUtil.instance.height),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(
                    child: Container(
                      width: ScreenUtil.instance.setWidth(160),
                      height: ScreenUtil.instance.setHeight(170),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(0, 5))
                          ],
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(Strings.GENERAL_IMAGE_URL),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Center(
                      child: CustomButton(
                    labelText: Strings.SIGN_IN_WITH_GMAIL,
                    isLoading: loading,
                    postIcon: Icons.arrow_back_ios,
                    visiblepostIcon: true,
                    onTap: () async {
                      setState(() {
                        loading = true;
                      });
                      user = await firebaseAuthService.handleSignIn();
                      if (user == null) {
                        setState(() {
                          loading = false;
                        });
                        showSnackbar(Strings.PROBLEM_IN_LOGIN, context);
                      } else {
                        await userService.getData();
                        setState(() {
                          loading = false;
                        });
                        currentPage = 0;
                        _navigateToSplashPage();
                      }
                    },
                  ))
                ],
              )),
        ),
      ),
    );
  }
}
