import 'package:elfath_account_app/pages/shared/colors.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final int tabIndex;
  const ProfilePage({super.key, required this.tabIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: Center(child: Text("profile")),
    );
  }
}
