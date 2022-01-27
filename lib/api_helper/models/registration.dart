// List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));
//
// String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class EventoRegistration {
  EventoRegistration({
    this.name,
    this.username,
    this.email,
    this.phoneNumber,
    this.password,
    this.password2,
  });
  String? name;
  String? username;
  String? email;
  String? phoneNumber;
  String? password;
  String? password2;

  factory EventoRegistration.fromJson(Map<String, dynamic> json) => EventoRegistration(
    name: json["name"],
    username: json["username"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    password: json['password'],
    password2: json['password2'],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "username": username,
    "email": email,
    "phone_number": phoneNumber,
    "password": password,
    "password2": password2,
  };
}