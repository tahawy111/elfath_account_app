import 'package:elfath_account_app/components/my_number.dart';
import 'package:elfath_account_app/pages/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Brand extends StatelessWidget {
  const Brand({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Image(
          image: AssetImage('assets/icon/elfath-logo.png'),
          height: 100,
        ),
        Text(
          "مركز الفتح",
          style: TextStyle(fontSize: 30),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            Number(number: "01063310981"),
            SizedBox(
              width: 10,
            ),
            // Number(number: "01117419902"),
            Icon(
              Icons.call,
              color: primaryColor,
              size: 18,
            ),
            Text(
              "01117419902",
              style: const TextStyle(fontSize: 15),
            ),
            SizedBox(
              width: 10,
            ),
            Number(number: "01145681652"),
          ],
        )
      ],
    );
  }
}
