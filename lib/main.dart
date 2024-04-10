import 'package:elfath_account_app/pages/layout.dart';
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
    return Directionality(
        textDirection: TextDirection.rtl,
        child: MaterialApp(
          theme: ThemeData(
            fontFamily: 'Cairo',
          ),
          debugShowCheckedModeBanner: false,
          home: const Layout(),
          routes: {
            "/layout": (context) => Layout(),
          },
        ));
  }
}
