import 'dart:convert';

List<Favorite> favoriteFromJson(String str) => List<Favorite>.from(json.decode(str).map((x) => Favorite.fromJson(x)));

String favoriteToJson(List<Favorite> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Favorite {
    Favorite({
        this.email,
        this.videoId,
    });

    String email;
    String videoId;

    factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        email: json["email"],
        videoId: json["video_id"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "video_id": videoId,
    };
}
