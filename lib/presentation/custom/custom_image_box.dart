import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageContainer extends StatelessWidget {
  final String image;
  final Function onTap;
  final bool isLoading;

  CustomImageContainer({
    this.image,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          alignment: Alignment.center,
          height: ScreenUtil.instance.setHeight(300),
          width: ScreenUtil.instance.setWidth(360),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Styles.PRIMARY_CREAM,
              boxShadow: [
                BoxShadow(
                    color: Styles.CREAM, blurRadius: 10, offset: Offset(1, 1))
              ]),
          child: isLoading
              ? CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Styles.DARK_GRAYBROWN),
                )
              : image != null
                  ? Image.network(
                      image,
                      fit: BoxFit.fill,
                    )
                  : Container(
                      padding: const EdgeInsets.all(16),
                      child: Icon(Icons.add_a_photo,
                          size: 50, color: Styles.COFFEE)),
        ),
      ),
    );
  }
}
