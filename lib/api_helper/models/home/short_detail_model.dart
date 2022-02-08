// .
class VendorShortDetails {
  VendorShortDetails({
    this.name,
    this.profilePicture,
  });

  String? name;
  String? profilePicture;

  factory VendorShortDetails.fromJson(Map<String?, dynamic> json) => VendorShortDetails(
    name: json["name"],
    profilePicture: json["profile_picture"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "profile_picture": profilePicture,
  };
}
