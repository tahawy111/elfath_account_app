import 'package:elfath_account_app/pages/layout.dart';
import 'package:elfath_account_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import "package:hive_flutter/hive_flutter.dart";

void main() async {
  // initialize hive
  await Hive.initFlutter();

  // open the box
  var box = await Hive.openBox("mybox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(
        tabIndex: 0,
      ),
      routes: {
        "/layout": (context) => Layout(),
      },
    );
  }
}
