
import 'dart:io';

class VendorUpdateProfileModel {
  VendorUpdateProfileModel({
    this.name,
    this.category,
    this.place,
    this.city,
    this.state,
    this.pincode,
    this.profilePicture,
    this.description,
  });

  String? name;
  String? category;
  String? description;
  File? profilePicture;
  String? place;
  String? city;
  String? state;
  String? pincode;

  factory VendorUpdateProfileModel.fromJson(Map<String, dynamic> json) => VendorUpdateProfileModel(
    name: json["full_name"],
    category: json['category'],
    place: json['place'],
    city: json["city"],
    state: json['state'],
    pincode: json["pincode"],
    description: json["description"],
    profilePicture: json["profile_picture"],
  );

  Map<String, dynamic> toJson() => {
    "full_name": name,
    "category": category,
    "place": place,
    "city": city,
    "state": state,
    "pincode": pincode,
    "description": description,
    "profile_picture": profilePicture,
  };
}