import 'dart:convert';

ResponseDefault responseDefaultFromJson(String str) =>
    ResponseDefault.fromJson(json.decode(str));

String responseDefaultToJson(ResponseDefault data) =>
    json.encode(data.toJson());

class ResponseDefault {
  ResponseDefault({
    this.status,
    this.error,
    this.data,
  });

  int status;
  bool error;
  Map data;

  factory ResponseDefault.fromJson(Map<String, dynamic> json) =>
      ResponseDefault(
        status: json["status"],
        error: json["error"],
        data: (json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "data": data,
      };
}
