import 'package:flutter/material.dart';

class NameValue extends StatelessWidget {
  final String name;
  final dynamic value;
  final bool? textWidget;
  const NameValue(
      {super.key, required this.name, required this.value, this.textWidget});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.symmetric(
            vertical: 8.0), // Adjust margin as needed
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(170, 0, 0, 0),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: textWidget == true
                  ? value
                  : Text(
                      value,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
