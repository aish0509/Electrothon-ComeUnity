import 'package:flutter_application_1/presentation/custom/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_application_1/utils/global.dart';

class MyEditForm extends StatefulWidget {
  @override
  _MyEditFormState createState() => _MyEditFormState();
}

class _MyEditFormState extends State<MyEditForm> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  TextEditingController _contactNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
        ),
        CustomTextField(
          hintText: 'Name',
          icon: Icons.person_outline,
          isPrefixIcon: true,
          controller: _fullNameController,
        ),
        SizedBox(
          height: ScreenUtil.instance.setHeight(10.0),
        ),
        CustomTextField(
          hintText: 'Bio',
          icon: Icons.chat_bubble_outline,
          isPrefixIcon: true,
          controller: _bioController,
          textInputType: TextInputType.multiline,
        ),
        SizedBox(
          height: ScreenUtil.instance.setHeight(10.0),
        ),
        CustomTextField(
          hintText: 'E-mail',
          icon: Icons.alternate_email,
          isPrefixIcon: true,
          controller: _emailController,
          textInputType: TextInputType.emailAddress,
        ),
        SizedBox(
          height: ScreenUtil.instance.setHeight(10.0),
        ),
        CustomTextField(
          hintText: 'Contact Number',
          icon: Icons.phone_in_talk,
          isPrefixIcon: true,
          controller: _contactNumberController,
          textInputType: TextInputType.phone,
        ),
        SizedBox(
          height: ScreenUtil.instance.setHeight(10.0),
        ),
        CustomTextField(
          //Dropdown menu need to be made for selecting skills/interest areas
          hintText: 'Areas of Interest',
          icon: Icons.bubble_chart,
          isPrefixIcon: true,
        ),
        SizedBox(
          height: ScreenUtil.instance.setHeight(20.0),
        ),
        RaisedButton(
            child: Text(
              'Save Changes',
              style: TextStyle(color: Colors.white, fontSize: 18.5),
            ),
            onPressed: () {}),
      ],
    );
  }
}
