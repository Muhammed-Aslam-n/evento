import 'package:dio/dio.dart';

class VendorProfileSetup {
  VendorProfileSetup({
    this.fullName,
    this.category,
    this.profilePicture,
    this.place,
    this.city,
    this.state,
    this.pincode,
    this.subscriptionType,
    this.subscriptionAmount
  });

  String? fullName;
  String? category;
  FormData? profilePicture;
  String? place;
  String? city;
  String? state;
  String? pincode;
  String? subscriptionType;
  String? subscriptionAmount;

  factory VendorProfileSetup.fromJson(Map<String, dynamic> json) => VendorProfileSetup(
    fullName: json["full_name"],
    category: json['category'],
    profilePicture: json["profile_picture"],
    place: json['place'],
    city: json["city"],
    state: json['state'],
    pincode: json["pincode"],
    subscriptionType: json['subscription_type'],
    subscriptionAmount: json["subscription_amount"],
  );

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "category": category,
    "profile_picture": profilePicture,
    "place": place,
    "city": city,
    "state": state,
    "pincode": pincode,
    "subscription_type": subscriptionType,
    "subscription_amount": subscriptionAmount,
  };
}