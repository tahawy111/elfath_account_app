import 'package:elfath_account_app/pages/shared/colors.dart';
import 'package:flutter/material.dart';

class RenewPage extends StatelessWidget {
  final int tabIndex;
  const RenewPage({super.key, required this.tabIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: Center(
        child: Text("Renew Page"),
      ),
    );
  }
}
