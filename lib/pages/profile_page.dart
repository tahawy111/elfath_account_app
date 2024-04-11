import 'package:elfath_account_app/components/brand.dart';
import 'package:elfath_account_app/components/my_number.dart';
import 'package:elfath_account_app/components/name_value.dart';
import 'package:elfath_account_app/pages/shared/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  final int tabIndex;
  const ProfilePage({super.key, required this.tabIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: const Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Brand(),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "معلومات حسابك الشخصي",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  )
                ],
              ),
              NameValue(
                  name: "اسم المستخدم", value: "01102734657@tedata.net.eg"),
              NameValue(name: "حالة الاشتراك", value: "اشتراكك نشط"),
              NameValue(name: "الرصيد", value: "0.00 L.E"),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "بيانات الباقة",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  )
                ],
              ),
              NameValue(
                  name: "الخدمة الحالية",
                  value: "سرعة 1 ميجا تصل ل 4 ميجا سعة استهلاك 50 جيجا 100 ج"),
              NameValue(name: "إجمالي التحميل المتاح لك", value: "50.0 GB"),
              NameValue(
                  name: "تاريخ انتهاء الاشتراك", value: "2024-05-05 00:00:00"),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "البيانات الشخصية",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  )
                ],
              ),
              NameValue(name: "الاسم الكامل", value: "احمد محسن"),
              NameValue(name: "اسم العائلة", value: "عائلة احمد محسن"),
              NameValue(name: "العنوان", value: "ش 16 بجوار حي احمد محسن"),
              NameValue(name: "الهاتف", value: "01036688782"),
              NameValue(
                  name: "البريد الالكتروني", value: "dc45dd3d@emailaoa.pro"),
            ],
          ),
        ),
      )),
    );
  }
}
