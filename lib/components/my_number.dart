import 'package:elfath_account_app/pages/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Number extends StatelessWidget {
  final String number;
  const Number({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        const Icon(
          Icons.call,
          color: primaryColor,
          size: 18,
        ),
        SvgPicture.asset(
          "assets/icon/whatsapp.svg",
          height: 20,
        ),
        Text(
          number,
          style: const TextStyle(fontSize: 15),
        )
      ],
    );
  }
}
