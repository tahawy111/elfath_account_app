import 'package:elfath_account_app/pages/shared/colors.dart';
import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: Center(
        child: Text("NotFoundPage"),
      ),
    );
  }
}
