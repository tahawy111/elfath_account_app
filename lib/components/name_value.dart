import 'package:flutter/material.dart';

class NameValue extends StatelessWidget {
  final String name;
  final String value;
  const NameValue({super.key, required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0), // Adjust margin as needed
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(170, 0, 0, 0),
              ),
            ),
            SizedBox(
                width:
                    15), // Adjust this value to change the amount of space between the Text widgets
            Expanded(
              child: Text(
                value,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
