import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String placeholder;
  final controller;
  final bool obscureText;

  // const MyTextField({super.key});
  // const MyTextField({super.key});
  const MyTextField({
    super.key,
    required this.placeholder,
    required this.controller,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    placeholder,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: placeholder,
                  hintTextDirection: TextDirection.rtl,
                  hintStyle: TextStyle(color: Colors.grey[500])),
            ),
          ],
        ));
  }
}
