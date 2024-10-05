// To parse this JSON data, do
//
//     final chuckyStation = chuckyStationFromJson(jsonString);

import 'dart:convert';

List<ChuckyStation> chuckyStationFromJson(String str) =>
    List<ChuckyStation>.from(
        json.decode(str).map((x) => ChuckyStation.fromJson(x)));

String chuckyStationToJson(List<ChuckyStation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChuckyStation {
  final String name;
  final String image;
  final int? userAgent;
  final int info;
  final String url;
  final bool? isHost;
  final dynamic embed;
  final String? referer;
  final dynamic usrAgent;

  ChuckyStation({
    required this.name,
    required this.image,
    required this.userAgent,
    required this.info,
    required this.url,
    required this.isHost,
    required this.embed,
    required this.referer,
    required this.usrAgent,
  });

  factory ChuckyStation.fromJson(Map<String, dynamic> json) => ChuckyStation(
        name: json["name"],
        image: json["image"],
        userAgent: json["userAgent"],
        info: json["info"],
        url: json["url"],
        isHost: json["isHost"],
        embed: json["embed"],
        referer: json["referer"],
        usrAgent: json["usrAgent"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "userAgent": userAgent,
        "info": info,
        "url": url,
        "isHost": isHost,
        "embed": embed,
        "referer": referer,
        "usrAgent": usrAgent,
      };
}
