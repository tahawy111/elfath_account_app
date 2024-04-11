import 'dart:convert';

class UserData {
  final PersonalAccountInfo yourPersonalAccountInfo;
  final ServiceData serviceData;
  final PersonalData personalData;
  final Quota yourQuota;

  UserData({
    required this.yourPersonalAccountInfo,
    required this.serviceData,
    required this.personalData,
    required this.yourQuota,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      yourPersonalAccountInfo:
          PersonalAccountInfo.fromJson(json['yourPersonalAccountInfo']),
      serviceData: ServiceData.fromJson(json['serviceData']),
      personalData: PersonalData.fromJson(json['personalData']),
      yourQuota: Quota.fromJson(json['yourQuota']),
    );
  }
}

class PersonalAccountInfo {
  final String username;
  final String subscriptionState;
  final String subscriptionType;
  final String yourDeviceMacAddress;
  final String account;

  PersonalAccountInfo({
    required this.username,
    required this.subscriptionState,
    required this.subscriptionType,
    required this.yourDeviceMacAddress,
    required this.account,
  });

  factory PersonalAccountInfo.fromJson(Map<String, dynamic> json) {
    return PersonalAccountInfo(
      username: json['username'],
      subscriptionState: json['subscriptionState'],
      subscriptionType: json['subscriptionType'],
      yourDeviceMacAddress: json['yourDeviceMacAddress'],
      account: json['account'],
    );
  }
}

class ServiceData {
  final String currentService;

  ServiceData({required this.currentService});

  factory ServiceData.fromJson(Map<String, dynamic> json) {
    return ServiceData(
      currentService: json['currentService'],
    );
  }
}

class PersonalData {
  final String firstName;
  final String familyName;
  final String address;
  final String phoneNumber;
  final String email;

  PersonalData({
    required this.firstName,
    required this.familyName,
    required this.address,
    required this.phoneNumber,
    required this.email,
  });

  factory PersonalData.fromJson(Map<String, dynamic> json) {
    return PersonalData(
      firstName: json['firstName'],
      familyName: json['familyName'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
    );
  }
}

class Quota {
  final String totalDownloadAvailableToYou;
  final String subscriptionExpDate;

  Quota({
    required this.totalDownloadAvailableToYou,
    required this.subscriptionExpDate,
  });

  factory Quota.fromJson(Map<String, dynamic> json) {
    return Quota(
      totalDownloadAvailableToYou: json['totalDownloadAvailableToYou'],
      subscriptionExpDate: json['subscriptionExpDate'],
    );
  }
}
