import 'dart:convert';
MoviesVideo moviesVideoFromJson(String str) => MoviesVideo.fromJson(json.decode(str));

String moviesVideoToJson(MoviesVideo data) => json.encode(data.toJson());

class MoviesVideo {
  MoviesVideo({
    required this.id,
    required this.results,
  });

  int id;
  List<Result> results;

  factory MoviesVideo.fromJson(Map<String, dynamic> json) => MoviesVideo(
    id: json["id"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  Iso6391? iso6391;
  Iso31661? iso31661;
  String name;
  String key;
  Site? site;
  int size;
  Type? type;
  bool official;
  DateTime publishedAt;
  String id;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    iso6391: iso6391Values.map[json["iso_639_1"]],
    iso31661: iso31661Values.map[json["iso_3166_1"]],
    name: json["name"],
    key: json["key"],
    site: siteValues.map[json["site"]],
    size: json["size"],
    type: typeValues.map[json["type"]],
    official: json["official"],
    publishedAt: DateTime.parse(json["published_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "iso_639_1": iso6391Values.reverse![iso6391],
    "iso_3166_1": iso31661Values.reverse![iso31661],
    "name": name,
    "key": key,
    "site": siteValues.reverse![site],
    "size": size,
    "type": typeValues.reverse![type],
    "official": official,
    "published_at": publishedAt.toIso8601String(),
    "id": id,
  };
}

enum Iso31661 { US }

final iso31661Values = EnumValues({
  "US": Iso31661.US
});

enum Iso6391 { EN }

final iso6391Values = EnumValues({
  "en": Iso6391.EN
});

enum Site { YOU_TUBE }

final siteValues = EnumValues({
  "YouTube": Site.YOU_TUBE
});

enum Type { FEATURETTE, CLIP, TEASER, TRAILER }

final typeValues = EnumValues({
  "Clip": Type.CLIP,
  "Featurette": Type.FEATURETTE,
  "Teaser": Type.TEASER,
  "Trailer": Type.TRAILER
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => new MapEntry(v, k));
    return reverseMap;
  }
}
