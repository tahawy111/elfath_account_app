import 'package:elfath_account_app/components/my_button.dart';
import 'package:elfath_account_app/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:elfath_account_app/pages/shared/colors.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // sign in user method
    void signUserIn() async {
      print({
        "username": usernameController.text,
        "password": passwordController.text
      });

      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => HomePage()));

      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString("username", usernameController.text);
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

              const SizedBox(height: 50),

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
              const SizedBox(height: 25),

              MyButton(
                onTap: signUserIn,
              )
            ],
          ),
        ),
      ),
    );
  }
}
