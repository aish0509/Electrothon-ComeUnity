import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/custom/custom_profile_card.dart';
import 'package:flutter_application_1/presentation/videoplayer.dart';
import 'package:flutter_application_1/utils/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  List videos_list = [
    ["https://www.youtube.com/watch?v=BClS40yzssA", "c++"],
    ["https://www.youtube.com/watch?v=rfscVS0vtbw", "python"],
    ["https://www.youtube.com/watch?v=7eh4d6sabA0", "ML"],
    ["https://www.youtube.com/watch?v=SSo_EIwHSd4", "blockchain"],
    ["https://www.youtube.com/watch?v=U8_8fTODn5g", "c"],
    ["https://www.youtube.com/watch?v=eIrMbAQSU34", "java"],
    ["https://www.youtube.com/watch?v=75lJDVT1h0", "golang"],
    ["https://www.youtube.com/watch?v=SuLiu5AK9Ps", "c#"],
    ["https://www.youtube.com/watch?v=sY-s7O0FiYE", "pointers"],
    ["https://www.youtube.com/watch?v=J464pe6ZTrE", "structure"],
    ["https://www.youtube.com/watch?v=vFEPkXybAlo", "ruby"],
  ];

  _navigateToVideoPlayer(String video , String name) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VideoPlayer(video: video , name : name)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Styles.CREAM,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: ScreenUtil.instance.setHeight(16),
            ),
            for (int i = 0; i < videos_list.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomProfileCard(
                  image:
                      "https://i.insider.com/551705a769bedda110343a79?width=1080&format=jpeg",
                  name: videos_list[i][1],
                  istrue: true,
                  imgh: 0,
                  imgw: 0,
                  number: "",
                  onTap: () {
                    _navigateToVideoPlayer(videos_list[i][0] , videos_list[i][1]);
                  },
                ),
              )
          ],
        ),
      ),
    ));
  }
}
