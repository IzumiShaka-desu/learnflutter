// To parse this JSON data, do
//
//     final chart = chartFromJson(jsonString);

import 'dart:convert';

List<Chart> chartFromJson(String str) => List<Chart>.from(json.decode(str).map((x) => Chart.fromJson(x)));

String chartToJson(List<Chart> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chart {
    Chart({
        this.idChart,
        this.name,
        this.detail,
        this.data,
        this.total,
    });

    String idChart;
    String name;
    String detail;
    List<Datum> data;
    double total;

    factory Chart.fromJson(Map<String, dynamic> json) => Chart(
        idChart: json["idChart"],
        name: json["name"],
        detail: json["detail"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "idChart": idChart,
        "name": name,
        "detail": detail,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total": total,
    };
}

class Datum {
    Datum({
        this.name,
        this.popularity,
    });

    String name;
    double popularity;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        popularity: json["popularity"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "popularity": popularity,
    };
}
