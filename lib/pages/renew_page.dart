import 'dart:convert';

import 'package:elfath_account_app/components/UserData.dart';
import 'package:elfath_account_app/components/brand.dart';
import 'package:elfath_account_app/pages/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class RenewPage extends StatefulWidget {
  final int tabIndex;
  const RenewPage({super.key, required this.tabIndex});

  @override
  State<RenewPage> createState() => _RenewPageState();
}

class ServiceInfo {
  final int price;
  final int capacity;

  ServiceInfo(this.price, this.capacity);
}

class _RenewPageState extends State<RenewPage> {
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

  void reNew() async {
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

  ServiceInfo getServiceData(String service) {
    RegExp priceRegex = RegExp(r'(\d+)\s*ج');
    RegExp CapacityRegex = RegExp(r'(\d+)\s*جيجا');

    // Extracting price
    var priceMatch = priceRegex.firstMatch(service);
    var price = int.parse(priceMatch!.group(1)!);

    // Extracting data volume
    var CapacityMatch = CapacityRegex.firstMatch(service);
    var capacity = int.parse(CapacityMatch!.group(1)!);

    return ServiceInfo(price, capacity);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Brand(),
            ),
            Divider(),
            if (userData != null) ...[
              Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    if (double.parse(userData!
                            .yourQuota.totalDownloadAvailableToYou
                            .split(" ")[0]) >
                        0) ...[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "عزيزي العميل! باقتك تعمل بالفعل فلا حاجة لتجديدها",
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              backgroundColor: greenColor),
                        ),
                      )
                    ] else ...[
                      // الرصيد
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                            child: Text(
                              "الرصيد",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(170, 0, 0, 0),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            userData!.yourPersonalAccountInfo.account,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      double.parse(userData!.yourPersonalAccountInfo.account
                                  .split(" ")[0]) <
                              getServiceData(
                                      userData!.serviceData.currentService)
                                  .price
                          ? Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "عفوا! ليس بإمكانك تجديد الباقة لانه ليس لديك الرصيدالكافي",
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    backgroundColor: yellowColor),
                              ),
                            )
                          : TextButton(
                              onPressed: reNew,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 20),
                                margin: EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  "تجديد الاشتراك",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            )
                    ] // end else check quota
                  ],
                ),
              )
            ] else ...[
              // Placeholder or loading indicator while userData is being fetched
              CircularProgressIndicator(
                color: primaryColor,
              ),
            ],
          ],
        ),
      )),
    );
  }
}
