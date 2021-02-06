import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/model.dart';
import 'package:flutter_application_1/presentation/custom/custom_profile_card.dart';
import 'package:flutter_application_1/presentation/login_screen.dart';
import 'package:flutter_application_1/presentation/modelviewer.dart';
import 'package:flutter_application_1/utils/global.dart';
import 'package:flutter_application_1/utils/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThreeD extends StatefulWidget {
  ThreeD({Key key}) : super(key: key);

  @override
  _ThreeDState createState() => _ThreeDState();
}

class _ThreeDState extends State<ThreeD> {
  _navigateToLoginPage() {
    Navigator.popAndPushNamed(context, LoginPage.routeNamed);
  }

  bool isLoading = false;

  @override
  void initState() {
    getModel();
    super.initState();
  }

  List<Mode> modeList = List<Mode>();
  getModel() async {
    setState(() {
      isLoading = true;
    });
    modeList = await modeService.getData();
    setState(() {
      isLoading = false;
    });
  }

                             _navigateToModelPage(String name , String url)
                             {
                                 Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>Model(name: name , url: url)),
    );

                             }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Styles.CREAM,
      child: (isLoading == false)
          ? SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(16),
                  ),
                  for (int i = 0; i < modeList.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CustomProfileCard(
                        image:
                            "https://i.insider.com/551705a769bedda110343a79?width=1080&format=jpeg",
                        name: modeList[i].name,
                        istrue: true,
                        imgh: 0,
                        imgw: 0,
                        number: "",
                        onTap:()
                        {
                             _navigateToModelPage(modeList[i].name , modeList[i].url);
                        }
                      ),
                    )
                ],
              ),
            )
          : Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
    ));
  }
}
