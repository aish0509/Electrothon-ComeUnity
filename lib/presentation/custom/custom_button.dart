import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final IconData postIcon;
  final bool visiblepostIcon;
  final String labelText;
  final FontWeight labelTextWeight;
  final double sizelabelText;
  final Function onTap;
  final double postIconSize;
  final Color postIconColor;
  final Color containerColor;
  final bool isLoading;
  final Color textColor;
  CustomButton(
      {this.postIcon,
      this.labelText,
      this.visiblepostIcon = false,
      this.sizelabelText = 22,
      this.labelTextWeight = FontWeight.w500,
      this.onTap,
      this.isLoading = false,
      this.postIconSize = 24,
      this.textColor = Styles.WHITE,
      this.postIconColor = Styles.DARK_GRAYBROWN,
      this.containerColor = Styles.DARK_TAN});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: ScreenUtil.instance.setWidth(200),
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 3, offset: Offset(0, 5))
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: (isLoading == false)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(labelText,
                          style: TextStyle(
                              color: textColor,
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: labelTextWeight)),
                      Container(
                        child: (visiblepostIcon)
                            ? Icon(
                                postIcon,
                                size: postIconSize,
                                color: postIconColor,
                              )
                            : Container(),
                      ),
                    ],
                  )
                : CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
