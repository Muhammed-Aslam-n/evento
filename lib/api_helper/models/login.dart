// List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));
//
// String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class EventoLogin {
  EventoLogin({
    this.email,
    this.password,
  });
  String? email;
  String? password;

  factory EventoLogin.fromJson(Map<String, dynamic> json) => EventoLogin(
    email: json["email"],
    password: json['password'],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}