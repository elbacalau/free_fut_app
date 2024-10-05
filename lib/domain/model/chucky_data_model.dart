// To parse this JSON data, do
//
//     final chuckyData = chuckyDataFromJson(jsonString);

import 'dart:convert';

ChuckyData chuckyDataFromJson(String str) =>
    ChuckyData.fromJson(json.decode(str));

String chuckyDataToJson(ChuckyData data) => json.encode(data.toJson());

class ChuckyData {
  final String name;
  final String author;
  final String image;
  final String info;
  final String telegram;
  final String url;
  final List<ChuckyDataGroup> groups;

  ChuckyData({
    required this.name,
    required this.author,
    required this.image,
    required this.info,
    required this.telegram,
    required this.url,
    required this.groups,
  });

  factory ChuckyData.fromJson(Map<String, dynamic> json) => ChuckyData(
        name: json["name"],
        author: json["author"],
        image: json["image"],
        info: json["info"],
        telegram: json["telegram"],
        url: json["url"],
        groups: List<ChuckyDataGroup>.from(
            json["groups"].map((x) => ChuckyDataGroup.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "author": author,
        "image": image,
        "info": info,
        "telegram": telegram,
        "url": url,
        "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
      };
}

class ChuckyDataGroup {
  final String name;
  final String image;
  final String? info;
  final List<Station>? stations;
  final List<GroupGroup>? groups;

  ChuckyDataGroup({
    required this.name,
    required this.image,
    required this.info,
    required this.stations,
    required this.groups,
  });

  factory ChuckyDataGroup.fromJson(Map<String, dynamic> json) =>
      ChuckyDataGroup(
        name: json["name"],
        image: json["image"],
        info: json["info"],
        stations: json["stations"] == null
            ? []
            : List<Station>.from(
                json["stations"]!.map((x) => Station.fromJson(x))),
        groups: json["groups"] == null
            ? []
            : List<GroupGroup>.from(
                json["groups"]!.map((x) => GroupGroup.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "info": info,
        "stations": stations == null
            ? []
            : List<dynamic>.from(stations!.map((x) => x.toJson())),
        "groups": groups == null
            ? []
            : List<dynamic>.from(groups!.map((x) => x.toJson())),
      };
}

class GroupGroup {
  final String name;
  final String image;
  final int info;
  final String url;
  final String userAgent;
  final bool groupImport;

  GroupGroup({
    required this.name,
    required this.image,
    required this.info,
    required this.url,
    required this.userAgent,
    required this.groupImport,
  });

  factory GroupGroup.fromJson(Map<String, dynamic> json) => GroupGroup(
        name: json["name"],
        image: json["image"],
        info: json["info"],
        url: json["url"],
        userAgent: json["userAgent"],
        groupImport: json["import"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "info": info,
        "url": url,
        "userAgent": userAgent,
        "import": groupImport,
      };
}

class Station {
  final String? name;
  final String? image;
  final int? userAgent;
  final int? info;
  final String? url;
  final bool? isHost;
  final bool? embed;
  final String? referer;
  final String? usrAgent;

  Station({
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

  factory Station.fromJson(Map<String, dynamic> json) => Station(
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
