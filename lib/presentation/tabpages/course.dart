import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/tabpages/3D.dart';
import 'package:flutter_application_1/presentation/tabpages/video.dart';
import 'package:flutter_application_1/utils/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Course extends StatefulWidget {
  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> {
  var value = 0;
  _getBody() {
    switch (value) {
      case 0:
        return ThreeD();
        break;
      case 1:
        return Video();
        break;
    }
  }

  _getTopBar() {
    return Card(
      color: Styles.COFFEE,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      margin: EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _getTopBarItem(index: 0, icontab: FontAwesomeIcons.youtube),
          _getTopBarItem(index: 1, icontab: FontAwesomeIcons.modx),
        ],
      ),
    );
  }

  _getTopBarItem({
    int index,
    IconData icontab,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          value = index;
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
                color: value == index ? Styles.DARK_TAN : Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Icon(
                  icontab,
                  color: value == index ? Colors.white : Styles.PRIMARY_CREAM,
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
    return Scaffold(
        backgroundColor: Styles.CREAM,
        body: Container(
          color: Styles.CREAM,
          child: Column(
            children: <Widget>[_getTopBar(), Expanded(child: _getBody())],
          ),
        ));
  }
}
