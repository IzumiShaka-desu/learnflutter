import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
    Profile({
        this.id,
        this.fullname,
        this.phone,
    });

    String id;
    String fullname;
    String phone;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        fullname: json["fullname"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "phone": phone,
    };
}
