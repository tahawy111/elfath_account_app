import 'package:elfath_account_app/pages/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfilePage extends StatelessWidget {
  final int tabIndex;
  const ProfilePage({super.key, required this.tabIndex});

  @override
  Widget build(BuildContext context) {
    final _myBox = Hive.box("mybox");

    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: Center(child: Text(_myBox.get("password"))),
    );
  }
}
