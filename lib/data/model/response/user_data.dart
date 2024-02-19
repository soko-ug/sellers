class UserData {
    String? name;
    String? countryCode;
    String? phone;
    String? qrCode;

    UserData({this.name, this.countryCode, this.phone, this.qrCode});

    UserData.fromJson(Map<String, dynamic> json) {
        name = json['name'];
        countryCode = json['country_code'];
        phone = json['phone'];
        qrCode = json['qr_code'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, String?> data = <String, String?>{};
        data['name'] = name;
        data['country_code'] = countryCode;
        data['phone'] = phone;
        data['qr_code'] = qrCode;
        return data;
    }
}


class SokoUser {
  SokoUser({
    this.id,
    this.type,
    this.name,
    this.email,
    this.avatar,
    this.avatar_original,
    this.phone,
    this.emailVerified,
  });

  int? id;
  String? type;
  String? name;
  String? email;
  String? avatar;
  String? avatar_original;
  String? phone;
  bool? emailVerified;

  factory SokoUser.fromJson(Map<String, dynamic> json) => SokoUser(
    id: json["id"],
    type: json["type"],
    name: json["name"],
    email: json["email"],
    avatar: json["avatar"],
    avatar_original: json["avatar_original"],
    phone: json["phone"],
    emailVerified: json["email_verified"],
  );

  get qrCode => null;

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "name": name,
    "email": email,
    "avatar": avatar,
    "avatar_original": avatar_original,
    "phone": phone,
    "email_verified": emailVerified,
  };
}
