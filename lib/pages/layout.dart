import 'package:elfath_account_app/pages/login_page.dart';
import 'package:elfath_account_app/pages/profile_page.dart';
import 'package:elfath_account_app/pages/renew_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        backgroundColor: Color(0xfff0f8ff),
        tabBar: CupertinoTabBar(
          backgroundColor: Color(0xff121212),
          activeColor: Color(0xff428cff),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'الملف الشخصي',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.money_dollar,
                size: 35,
              ),
              label: 'تجديد الاشتراك',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'تسجيل الخروج',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(builder: (BuildContext context) {
            switch (index) {
              case 0:
                return ProfilePage();
              case 1: // Corrected index for the second tab
                // Return the appropriate page for the second tab
                return RenewPage(); // For example, replace SecondPage() with the appropriate page widget
              default:
                // Handle any other cases, such as returning a default page
                return LoginPage(); // PlaceholderPage() is just a placeholder, replace it with the appropriate widget
            }
          });
        });
  }
}
