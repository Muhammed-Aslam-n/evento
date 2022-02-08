// .
class VendorWholeDetails {
  VendorWholeDetails({
    this.id,
    this.category,
    this.name,
    this.description,
    this.profilePicture,
    this.place,
    this.city,
    this.state,
    this.pincode,
    this.subscriptionType,
    this.subscriptionAmount,
    this.subscriptionDate,
    this.expiryDate,
    this.user,
    this.showCase1,this.showCase2,this.showCase3,this.showCase4,this.showCase5,
  });

  int? id;
  String? category;
  String? name;
  String? description;
  String? profilePicture;
  String? place;
  String? city;
  String? state;
  String? pincode;
  String? subscriptionType;
  String? subscriptionAmount;
  DateTime? subscriptionDate;
  DateTime? expiryDate;
  int? user;
  String? showCase1;
  String? showCase2;
  String? showCase3;
  String? showCase4;
  String? showCase5;

  factory VendorWholeDetails.fromJson(Map<String?, dynamic> json) => VendorWholeDetails(
    id: json["id"],
    category: json["category"],
    name: json["name"],
    description: json["description"],
    profilePicture: json["profile_picture"],
    place: json["place"],
    city: json["city"],
    state: json["state"],
    pincode: json["pincode"],
    subscriptionType: json["subscription_type"],
    subscriptionAmount: json["subscription_amount"],
    subscriptionDate: DateTime.parse(json["subscription_date"]),
    expiryDate: DateTime.parse(json["expiry_date"]),
    showCase1: json["image1"],
    showCase2: json["image2"],
    showCase3: json["image3"],
    showCase4: json["image4"],
    showCase5: json["image5"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "name": name,
    "description": description,
    "profile_picture": profilePicture,
    "place": place,
    "city": city,
    "state": state,
    "pincode": pincode,
    "subscription_type": subscriptionType,
    "subscription_amount": subscriptionAmount,
    "subscription_date": "${subscriptionDate?.year.toString().padLeft(4, '0')}-${subscriptionDate?.month.toString().padLeft(2, '0')}-${subscriptionDate?.day.toString().padLeft(2, '0')}",
    "expiry_date": "${expiryDate?.year.toString().padLeft(4, '0')}-${expiryDate?.month.toString().padLeft(2, '0')}-${expiryDate?.day.toString().padLeft(2, '0')}",
    "user": user,
    "image1": showCase1,
    "image2": showCase2,
    "image3": showCase3,
    "image4": showCase4,
    "image5": showCase5,
  };
}
