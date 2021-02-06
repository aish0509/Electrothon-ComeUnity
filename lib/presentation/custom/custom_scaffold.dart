import 'package:flutter_application_1/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Function appbarOnTap;
  final Widget body;
  final String appBarText;
  final double appBarTextSize;
  CustomScaffold(
      {this.appbarOnTap, this.body, this.appBarText, this.appBarTextSize: 19});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.CREAM,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Styles.COFFEE,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                icon: new Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 28,
                ),
                onPressed: appbarOnTap,
              ),
              Text(
                appBarText,
                style: TextStyle(
                    fontSize: appBarTextSize,
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        body: body,
      ),
    );
  }
}
