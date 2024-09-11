import 'dart:convert';

// Convierte el JSON a la clase ChuckyList
ChuckyList chuckyListFromJson(String str) =>
    ChuckyList.fromJson(json.decode(str));

// Convierte la clase ChuckyList a JSON
String chuckyListToJson(ChuckyList data) => json.encode(data.toJson());

class ChuckyList {
  final String name;
  final String author;
  final String image;
  final String info;
  final String telegram;
  final String url;
  final List<ChuckyListGroup> groups;

  ChuckyList({
    required this.name,
    required this.author,
    required this.image,
    required this.info,
    required this.telegram,
    required this.url,
    required this.groups,
  });

  // Convertir desde JSON
  factory ChuckyList.fromJson(Map<String, dynamic> json) => ChuckyList(
        name: json["name"] ?? '',
        author: json["author"] ?? '',
        image: json["image"] ?? '',
        info: json["info"] ?? '',
        telegram: json["telegram"] ?? '',
        url: json["url"] ?? '',
        groups: json["groups"] != null
            ? List<ChuckyListGroup>.from(
                json["groups"].map((x) => ChuckyListGroup.fromJson(x)))
            : [],
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

class ChuckyListGroup {
  final String name;
  final String image;
  final String info;
  final List<Station> stations;
  final List<GroupGroup> groups;

  ChuckyListGroup({
    required this.name,
    required this.image,
    required this.info,
    required this.stations,
    required this.groups,
  });

  factory ChuckyListGroup.fromJson(Map<String, dynamic> json) =>
      ChuckyListGroup(
        name: json["name"] ?? '',
        image: json["image"] ?? '',
        info: json["info"] ?? '',
        stations: json["stations"] != null
            ? List<Station>.from(
                json["stations"].map((x) => Station.fromJson(x)))
            : [],
        groups: json["groups"] != null
            ? List<GroupGroup>.from(
                json["groups"].map((x) => GroupGroup.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "info": info,
        "stations": List<dynamic>.from(stations.map((x) => x.toJson())),
        "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
      };
}

class GroupGroup {
  final String name;
  final String image;
  final String url;
  final String userAgent;
  final String groupImport;

  GroupGroup({
    required this.name,
    required this.image,
    required this.url,
    required this.userAgent,
    required this.groupImport,
  });

  factory GroupGroup.fromJson(Map<String, dynamic> json) => GroupGroup(
        name: json["name"] ?? '',
        image: json["image"] ?? '',
        url: json["url"] ?? '',
        userAgent: json["userAgent"] ?? '',
        groupImport: json["import"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "url": url,
        "userAgent": userAgent,
        "import": groupImport,
      };
}

class Station {
  final String name;
  final String image;
  final UserAgent userAgent;
  final String url;
  final String isHost;
  final String embed;
  final String referer;
  final UserAgent userAgentet;
  final String usrAgent;

  Station({
    required this.name,
    required this.image,
    required this.userAgent,
    required this.url,
    required this.isHost,
    required this.embed,
    required this.referer,
    required this.userAgentet,
    required this.usrAgent,
  });

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        name: json["name"] ?? '',
        image: json["image"] ?? '',
        userAgent: userAgentValues.map[json["userAgent"]] ?? UserAgent.EMPTY,
        url: json["url"] ?? '',
        isHost: json["isHost"] ?? '',
        embed: json["embed"] ?? '',
        referer: json["referer"] ?? '',
        userAgentet:
            userAgentValues.map[json["userAgentet"]] ?? UserAgent.EMPTY,
        usrAgent: json["usrAgent"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "userAgent": userAgentValues.reverse[userAgent],
        "url": url,
        "isHost": isHost,
        "embed": embed,
        "referer": referer,
        "userAgentet": userAgentValues.reverse[userAgentet],
        "usrAgent": usrAgent,
      };
}

enum UserAgent { EMPTY, USER_AGENT }

final userAgentValues =
    EnumValues({"": UserAgent.EMPTY, " ": UserAgent.USER_AGENT});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

class GroupCardHome {
  final String name;
  final String image;
  final String? info;

  GroupCardHome({
    required this.name,
    required this.image,
    this.info,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "info": info,
      };

  factory GroupCardHome.fromJson(Map<String, dynamic> json) => GroupCardHome(
        name: json["name"] ?? '',
        image: json["image"] ?? '',
        info: json["info"],
      );

  static List<GroupCardHome> convertGroupsToCardHomes(
      List<ChuckyListGroup> groups) {
    return groups
        .map((group) => GroupCardHome(
              name: group.name,
              image: group.image,
              info: group.info.isNotEmpty ? group.info : null,
            ))
        .toList();
  }
}
