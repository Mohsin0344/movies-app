import 'dart:convert';

import '../../api/api_client.dart';


class MovieTrailerKeyModel implements Decodable<MovieTrailerKeyModel> {
  int? id;
  List<Result>? results;

  MovieTrailerKeyModel({
    this.id,
    this.results,
  });

  factory MovieTrailerKeyModel.fromRawJson(String str) => MovieTrailerKeyModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MovieTrailerKeyModel.fromJson(Map<String, dynamic> json) => MovieTrailerKeyModel(
    id: json["id"],
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };

  @override
  MovieTrailerKeyModel fromJson(Map<String, dynamic> json) {
    id = json["id"];
    results = json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x)));
    return this;
  }
}

class Result {
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  DateTime? publishedAt;
  String? id;

  Result({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    iso6391: json["iso_639_1"],
    iso31661: json["iso_3166_1"],
    name: json["name"],
    key: json["key"],
    site: json["site"],
    size: json["size"],
    type: json["type"],
    official: json["official"],
    publishedAt: json["published_at"] == null ? null : DateTime.parse(json["published_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "iso_639_1": iso6391,
    "iso_3166_1": iso31661,
    "name": name,
    "key": key,
    "site": site,
    "size": size,
    "type": type,
    "official": official,
    "published_at": publishedAt?.toIso8601String(),
    "id": id,
  };
}
