
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/presentation/tabpages/course.dart';
import 'package:flutter_application_1/presentation/tabpages/homepage.dart';
import 'package:flutter_application_1/presentation/tabpages/postpage.dart';
import 'package:flutter_application_1/presentation/tabpages/profilepage.dart';
import 'package:flutter_application_1/utils/global.dart';
import 'package:flutter_application_1/utils/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SplashPage extends StatefulWidget {
  static const String routeNamed = 'SplashPage';
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _getBody() {
    switch (currentPage) {
      case 0:
        return HomePage();
        break;
      case 1:
        return HomePage();
        break;
      case 2:
        return PostPage()
        break;
      case 3:
        return Course();
        break;
      case 4:
        return Profile(profile:userData, page:false);
        break;
      default:
        return HomePage();
    }
  }

  _getBottomBar() {
    return Card(
      color: Styles.COFFEE,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      margin: EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _getBottomBarItem(index: 0, icontab: Icons.home),
          _getBottomBarItem(index: 1, icontab: Icons.search),
          _getBottomBarItem(
            index: 2,
            icontab: Icons.add,
          ),
          _getBottomBarItem(
              index: 3, icontab: FontAwesomeIcons.solidObjectGroup),
          _getBottomBarItem(index: 4, icontab: Icons.person),
        ],
      ),
    );
  }

  _getBottomBarItem({
    int index,
    IconData icontab,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentPage = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: ScreenUtil.instance.setHeight(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color:
                    currentPage == index ? Styles.DARK_TAN : Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Icon(
                  icontab,
                  color: currentPage == index
                      ? Colors.white
                      : Styles.PRIMARY_CREAM,
                  size: ScreenUtil.instance.setHeight(32),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
        height: defaultHeight, width: defaultWidth, allowFontScaling: false)
      ..init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[Expanded(child: _getBody()), _getBottomBar()],
        ),
        resizeToAvoidBottomPadding: false,
      ),
    );
  }
}
