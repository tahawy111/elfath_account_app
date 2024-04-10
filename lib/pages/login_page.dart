import 'dart:async';
import 'dart:convert';

import 'package:elfath_account_app/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:elfath_account_app/pages/shared/colors.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  final int tabIndex;
  LoginPage({super.key, required this.tabIndex});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  String error = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // sign in user method

    final _mybox = Hive.box("mybox");

    Future signUserIn() async {
      setState(() {
        isLoading = true;
      });
      if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
        setState(() {
          error = "برجاء إدخال اسم المستخدم او كلمة المرور!!";
        });
        return;
      }

      var body = jsonEncode({
        "username": usernameController.text,
        "password": passwordController.text
      });

      dynamic res = await http.post(Uri.parse('http://192.168.15.8:5000/login'),
          body: body, headers: {"Content-type": "application/json"});

      if (res.statusCode == 200) {
        Navigator.pushNamed(context, "/layout");
        // save to local storage

        setState(() {
          isLoading = false;
        });

        _mybox.put("username", usernameController.text);
        _mybox.put("password", passwordController.text);
        _mybox.put("isAuthenticated", true);

        return;
      } else {
        // Extract error message from response body if available
        final dynamic responseData = jsonDecode(res.body);
        final errorMessage = responseData['msg'] ?? 'فشل تسجيل الدخول';
        setState(() {
          error = errorMessage;
          isLoading = false;
        });
        return;
      }
    }

    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // logo
              const SizedBox(height: 50),

              Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(height: 10),
              isLoading == true
                  ? CircularProgressIndicator(
                      color: primaryColor,
                    )
                  : Text(""),

              const SizedBox(height: 30),

              // مرحبا بكم في تطبيق الفتح اكونت
              Text(
                "مرحبا بكم في تطبيق الفتح اكونت",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500),
              ),

              const SizedBox(height: 25),

              // username Text Field
              MyTextField(
                placeholder: "اسم المستخدم",
                controller: usernameController,
                obscureText: false,
              ),

              // password Text Field
              MyTextField(
                placeholder: "كلمة المرور",
                controller: passwordController,
                obscureText: true,
              ),

              // signin button
              const SizedBox(height: 15),

              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 15),
              ),

              const SizedBox(height: 15),
              // MyButton(
              //   onTap: signUserIn,
              // )
              TextButton(
                onPressed: signUserIn,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "تسجيل الدخول",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
