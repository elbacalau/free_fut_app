import 'dart:convert';

List<ChuckyGroup> chuckyGroupFromJson(String str) => List<ChuckyGroup>.from(
    json.decode(str).map((x) => ChuckyGroup.fromJson(x)));

String chuckyGroupToJson(List<ChuckyGroup> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChuckyGroup {
  final String name;
  final String image;
  final String? info;
  final List<Station>? stations;
  final List<Group>? groups;

  ChuckyGroup({
    required this.name,
    required this.image,
    required this.info,
    required this.stations,
    required this.groups,
  });

  factory ChuckyGroup.fromJson(Map<String, dynamic> json) => ChuckyGroup(
        name: json["name"],
        image: json["image"],
        info: json["info"],
        stations: json["stations"] == null
            ? []
            : List<Station>.from(
                json["stations"]!.map((x) => Station.fromJson(x))),
        groups: json["groups"] == null
            ? []
            : List<Group>.from(json["groups"]!.map((x) => Group.fromJson(x))),
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

class Group {
  final String name;
  final String image;
  final int info;
  final String url;
  final String userAgent;
  final bool groupImport;

  Group({
    required this.name,
    required this.image,
    required this.info,
    required this.url,
    required this.userAgent,
    required this.groupImport,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
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
