import 'package:elfath_account_app/pages/login_page.dart';
import 'package:elfath_account_app/pages/profile_page.dart';
import 'package:elfath_account_app/pages/renew_page.dart';
import 'package:elfath_account_app/pages/shared/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int tabIndex = 0;
  @override
  void initState() {
    super.initState();
    // Check authentication status when the widget initializes
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    // Example using Hive for storing authentication status
    final Box box = await Hive.openBox('auth');
    final bool isAuthenticated =
        box.get('isAuthenticated', defaultValue: false);

    // If not authenticated, navigate to the login page
    if (!isAuthenticated) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => LoginPage(
                    tabIndex: tabIndex,
                  )));
    }
  }

  Widget build(BuildContext context) {
    final List<Widget> pages = [
      // Your pages here
      ProfilePage(
        tabIndex: tabIndex,
      ),
      RenewPage(
        tabIndex: tabIndex,
      ), // Example page 2
      LoginPage(
        tabIndex: tabIndex,
      )
    ];

    void handleLogout() {
      // Perform your logout logic here
      // For example, clear user session or navigate to login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage(
                  tabIndex: tabIndex,
                )),
      );
    }

// Handle tap events on bottom navigation bar items
    void onItemTapped(int index) {
      setState(() {
        tabIndex = index;
        // Logout if the logout item is tapped
        if (index == 2) {
          handleLogout();
        }
      });
    }

    // Logout logic

    return Scaffold(
      body: pages[tabIndex],
      backgroundColor: Color(0xfff0f8ff),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onItemTapped,
        currentIndex: tabIndex,
        backgroundColor: Color(0xff121212),
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'الملف الشخصي',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.money_dollar,
            ),
            label: 'تجديد الاشتراك',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'تسجيل الخروج',
          ),
        ],
      ),
    );
  }
}
