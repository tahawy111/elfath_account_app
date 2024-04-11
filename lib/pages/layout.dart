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
  int beforeChangeTabIndex = 0;
  @override
  void initState() {
    super.initState();
    // Check authentication status when the widget initializes
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    // Example using Hive for storing authentication status
    final Box box = await Hive.openBox('mybox');
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
      Text("LogOut")
    ];

    void _handleLogout() async {
      // Perform logout logic and update authentication status
      // For example, clear user session or token

      final Box box = Hive.box('mybox');
      // box.put('isAuthenticated', false);
      box.clear();

      // Navigate to login page
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => LoginPage(
                    tabIndex: tabIndex,
                  )));
    }

    void _showDialog() {
      showDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text("هل تريد بالفعل تسجيل الخروج؟"),
              actions: [
                MaterialButton(
                  onPressed: () {
                    print("tabIndex: $beforeChangeTabIndex");
                    Navigator.pop(context);
                    setState(() {
                      tabIndex = beforeChangeTabIndex;
                    });
                  },
                  child: Text("لا"),
                ),
                MaterialButton(
                  onPressed: () {
                    _handleLogout();
                  },
                  child: Text("نعم"),
                )
              ],
            );
          });
    }

// Handle tap events on bottom navigation bar items
    void onItemTapped(int index) {
      setState(() {
        beforeChangeTabIndex = tabIndex;
        tabIndex = index;
        // Logout if the logout item is tapped
        if (index == 2) {
          _showDialog();
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
            icon: Icon(Icons.person),
            label: 'الملف الشخصي',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.money_dollar,
              size: 25,
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
