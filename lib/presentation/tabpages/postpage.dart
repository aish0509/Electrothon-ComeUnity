import 'dart:io';

import 'package:flutter_application_1/models/post.dart';
import 'package:flutter_application_1/presentation/custom/custom_button.dart';
import 'package:flutter_application_1/presentation/custom/custom_image_box.dart';
import 'package:flutter_application_1/presentation/splashpage.dart';
import 'package:flutter_application_1/utils/global.dart';
import 'package:flutter_application_1/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  Post post = Post();
  bool isUploading = false;
  bool isLoading = false;

  _imageUpload() async {
    try {
      setState(() {
        isUploading = true;
      });
      File file = await ImagePicker.pickImage(source: ImageSource.gallery);
      print(file);
      if (file != null) {
        String uid = DateTime.now().millisecondsSinceEpoch.toString();
        String url =
            await postService.uploadingImage(imageFile: file, uid: uid);
        setState(() {
          post.uid = uid;
          post.image = url;
          isUploading = false;
        });
      }
    } catch (e) {
      print(e);
      showSnackbar(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Styles.CREAM,
          body: Builder(
            builder: (BuildContext context) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(32),
                    ),
                    CustomImageContainer(
                      isLoading: isUploading,
                      onTap: _imageUpload,
                      image: post.image,
                    ),
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(32),
                    ),
                    Text('Title:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(8),
                    ),
                    TextField(
                      minLines: 1,
                      keyboardType: TextInputType.multiline,
                      onChanged: (v) {
                        post.title = v;
                      },
                      maxLines: null,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                BorderSide(color: Styles.COFFEE, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                BorderSide(color: Styles.COFFEE, width: 2)),
                        hintText: 'Title',
                      ),
                    ),
                    Text('Description:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(8),
                    ),
                    TextField(
                      minLines: 3,
                      keyboardType: TextInputType.multiline,
                      onChanged: (v) {
                        post.desc = v;
                      },
                      maxLines: null,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                BorderSide(color: Styles.COFFEE, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                BorderSide(color: Styles.COFFEE, width: 2)),
                        hintText: 'Description',
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(32),
                    ),
                    Center(
                      child: CustomButton(
                        containerColor: Styles.COFFEE,
                        labelText: 'Post',
                        isLoading: isLoading,
                        onTap: () async {
                          try {
                            setState(() {
                              isLoading = true;
                            });
                            if (post.desc != null) {
                              await postService.uploadPost(post: post);
                              showToast(msg: "Succesfully Posted!");

                              setState(() {
                                post = Post();
                              });
                              currentPage = 0;
                              Navigator.pushNamed(
                                  context, SplashPage.routeNamed);
                            } else {
                              showToast(msg: "Please provide Valid Data");
                            }
                          } catch (e) {
                            showSnackbar(e.toString(), context);
                          }
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
