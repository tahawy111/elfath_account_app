import 'package:elfath_account_app/pages/layout.dart';
import 'package:elfath_account_app/pages/renew_page.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/profile_page.dart';

void main() {
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
