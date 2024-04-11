import 'dart:convert';

import 'package:elfath_account_app/components/UserData.dart';
import 'package:elfath_account_app/components/brand.dart';
import 'package:elfath_account_app/components/name_value.dart';
import 'package:elfath_account_app/pages/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  final int tabIndex;
  const ProfilePage({super.key, required this.tabIndex});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = false;
  UserData? userData; // Use nullable UserData to handle initial null value

  final _mybox = Hive.box("mybox");

  @override
  void initState() {
    super.initState();
    // fetch userData
    fetchUserData();
  }

  void fetchUserData() async {
    String username = _mybox.get("username");
    String password = _mybox.get("password");
    dynamic res = await http.get(
        Uri.parse('http://192.168.15.8:5000/getUserData/$username/$password'),
        headers: {"Content-type": "application/json"});

    Map<String, dynamic> jsonData = jsonDecode(res.body);
    UserData _userData = UserData.fromJson(jsonData);
    setState(() {
      userData = _userData; // Assign fetched userData to the state variable
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Center(
                  child: Brand(),
                ),
                Divider(),
                // Check if userData is available before accessing it
                if (userData != null) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "معلومات حسابك الشخصي",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                  NameValue(
                    name: "اسم المستخدم",
                    value: userData!.yourPersonalAccountInfo.username,
                  ),
                  NameValue(
                    name: "حالة الاشتراك",
                    value: userData!
                                .yourPersonalAccountInfo.subscriptionState ==
                            "اشتراكك نشط"
                        ? Text(
                            userData!.yourPersonalAccountInfo.subscriptionState,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Color(0xff00e51b)),
                          )
                        : userData!.yourPersonalAccountInfo.subscriptionState ==
                                "انتهت فترة اشتراكك"
                            ? Text(
                                userData!
                                    .yourPersonalAccountInfo.subscriptionState,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: yellowColor,
                                ))
                            : userData!.yourPersonalAccountInfo
                                        .subscriptionState
                                        .trim() ==
                                    "اشتراك موقوف"
                                ? Text(
                                    userData!.yourPersonalAccountInfo
                                        .subscriptionState,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        backgroundColor: Color(0xffff3e3e)),
                                  )
                                : Text(
                                    userData!.yourPersonalAccountInfo
                                        .subscriptionState,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                    textWidget: true,
                  ),
                  NameValue(
                    name: "الرصيد",
                    value: userData!.yourPersonalAccountInfo.account,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "بيانات الباقة",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                  NameValue(
                    name: "الخدمة الحالية",
                    value: userData!.serviceData.currentService,
                  ),
                  NameValue(
                    name: "إجمالي التحميل المتاح لك",
                    value: userData!.yourQuota.totalDownloadAvailableToYou,
                  ),
                  NameValue(
                    name: "تاريخ انتهاء الاشتراك",
                    value: userData!.yourQuota.subscriptionExpDate,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "البيانات الشخصية",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                  NameValue(
                    name: "الاسم الكامل",
                    value: userData!.personalData.firstName,
                  ),
                  NameValue(
                    name: "اسم العائلة",
                    value: userData!.personalData.familyName,
                  ),
                  NameValue(
                    name: "العنوان",
                    value: userData!.personalData.address,
                  ),
                  NameValue(
                    name: "الهاتف",
                    value: userData!.personalData.phoneNumber,
                  ),
                  NameValue(
                    name: "البريد الالكتروني",
                    value: userData!.personalData.email,
                  ),
                ] else ...[
                  // Placeholder or loading indicator while userData is being fetched
                  CircularProgressIndicator(
                    color: primaryColor,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
