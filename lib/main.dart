
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils/string_values.dart';
import 'package:flutter_application_1/utils/styles.dart';

void main() => runApp(ComeUnity());

class ComeUnity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: OurTheme().buildTheme(),
      title: Strings.APP_NAME,
      debugShowCheckedModeBanner: false,
      // initialRoute: Auth.routeNamed,
      routes: {

      },
    );
  }
}
