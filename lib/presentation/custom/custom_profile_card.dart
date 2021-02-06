import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileCard extends StatelessWidget {
  final String image;
  final String name;
  final String number;
  final bool istrue;
  final double imgh;
  final double imgw;
  final bool isData;
  final bool isLoading;
  final Function onTap;
  CustomProfileCard(
      {this.isData = false,
         this.onTap,
         this.isLoading=false,
      this.imgh = 90,
      this.imgw = 80,
      this.image,
      this.name,
      this.number,
      this.istrue = true});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (istrue)
          ? EdgeInsets.symmetric(horizontal: 1, vertical: 1)
          : EdgeInsets.all(0),
      child: Container(
        padding: (istrue)
            ? const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
            : EdgeInsets.all(0),
        margin: EdgeInsets.only(bottom: 14),
        decoration: (istrue)
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Styles.PRIMARY_CREAM,
                boxShadow: [
                    BoxShadow(
                             color: Styles.DARK_GRAYBROWN,
                        blurRadius: 2,
                        offset: Offset(0, 0))
                  ])
            : BoxDecoration(),
        child: (isData== false)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: ScreenUtil.instance.setHeight(imgh),
                        width: ScreenUtil.instance.setWidth(imgw),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            image: DecorationImage(
                                image: NetworkImage(image), fit: BoxFit.fill)),
                      ),
                      Container(
                        child: SizedBox(
                          width: (istrue)
                              ? ScreenUtil.instance.setWidth(10)
                              : ScreenUtil.instance.setWidth(35),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: ScreenUtil.instance.setWidth(200),
                                  child: Text(name,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                ),
                                SizedBox(
                                  height: ScreenUtil.instance.setHeight(3),
                                ),
                                Container(
                                    width: ScreenUtil.instance.setWidth(200),
                                    child: Text(
                                      number,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: onTap,
                    child: (isLoading== false)?Container(
                        child: (istrue)
                            ? Icon(Icons.arrow_forward_ios)
                            : Container()):CircularProgressIndicator(),
                  )
                ],
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
