import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String initialValue;
  final TextEditingController controller;
  final double width;
  final TextInputType textInputType;
  final Function onSaved;
  final Function onChanged;
  final Function validator;
  final IconData icon;
  final bool isPrefixIcon;
  final bool size;
  final bool isSearch;
  CustomTextField({
    this.labelText,
    this.hintText,
    this.initialValue,
    this.controller,
    this.width,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.textInputType = TextInputType.text,
    this.icon = Icons.location_on,
    this.isPrefixIcon = false,
    this.size = false,
    this.isSearch = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.instance.setWidth((size)
          ? ScreenUtil.instance.setWidth(ScreenUtil.instance.width)
          : ScreenUtil.instance.setWidth(380)),
      margin: EdgeInsets.symmetric(
          vertical: (size) ? 0 : ScreenUtil.instance.setWidth(5)),
      padding: EdgeInsets.symmetric(
          horizontal: (size) ? 0 : ScreenUtil.instance.setWidth(2)),
      decoration: BoxDecoration(color: Styles.PRIMARY_CREAM, boxShadow: [
        BoxShadow(
            color: Styles.GRAY_BROWN.withOpacity(.1),
            blurRadius: 3,
            offset: Offset(0, 5))
      ]),
      child: Padding(
        padding: (isPrefixIcon) ? EdgeInsets.all(0) : EdgeInsets.only(left: 16),
        child: TextFormField(
            onSaved: onSaved,
            onChanged: onChanged,
            keyboardType: textInputType,
            initialValue: initialValue,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                labelText: labelText,
                prefixIcon: isPrefixIcon
                    ? Icon(
                        icon,
                        color: Styles.DARK_GRAYBROWN,
                      )
                    : null,
                hintStyle: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400))),
      ),
    );
  }
}
