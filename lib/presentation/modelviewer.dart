//import styles.dart and custom scaffold
import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';
import 'package:flutter_application_1/utils/styles.dart';
import 'package:flutter_application_1/presentation/custom/custom_scaffold.dart';

class Model extends StatefulWidget {
  static const String routeNamed = 'model';
  String name;
  String url;
  Model({this.name, this.url});

  @override
  _ModelState createState() => _ModelState(name, url);
}

class _ModelState extends State<Model> {
  String name;
  String url;
  _ModelState(this.name, this.url);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarText: name,
      appbarOnTap: () {
        Navigator.pop(context);
      },
      body: ModelViewer(
        backgroundColor: Styles.CREAM,
        src: url,
        alt: name,
        ar: true,
        autoRotate: true,
        cameraControls: true,
      ),
    );
  }
}
