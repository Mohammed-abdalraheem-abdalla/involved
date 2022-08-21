import 'dart:convert';

Searching SearchingFromJson(String str) => Searching.fromJson(json.decode(str));

String SearchingToJson(Searching data) => json.encode(data.toJson());

class Searching {
  Searching({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory Searching.fromJson(Map<String, dynamic> json) => Searching(
    page: json["page"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class Result {
  Result({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.firstAirDate,
    required this.name,
    required this.originCountry,
    required this.originalName,
    required this.gender,
    required this.knownFor,
    required this.knownForDepartment,
    required this.profilePath,
  });

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  MediaType? mediaType;
  OriginalLanguage? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  DateTime? firstAirDate;
  String? name;
  List<String>? originCountry;
  String? originalName;
  int? gender;
  List<KnownFor>? knownFor;
  String? knownForDepartment;
  String? profilePath;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    adult: json["adult"] == null ? null :json["adult"]!,
    backdropPath: json["backdrop_path"] == null ? null :json["backdrop_path"]!,
    genreIds: json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"] == null ? null : json["id"]!,
    mediaType: mediaTypeValues.map[json["media_type"]] == null ? null : mediaTypeValues.map[json["media_type"]]!,
    originalLanguage: json["original_language"] == null ? null : originalLanguageValues.map[json["original_language"]!],
    originalTitle: json["original_title"] == null ? null : json["original_title"]!,
    overview: json["overview"] == null ? null : json["overview"]!,
    popularity: json["popularity"] == null ? null : json["popularity"].toDouble()!,
    posterPath: json["poster_path"] == null ? null : json["poster_path"]!,
    releaseDate: json["release_date"] == null || json["release_date"] == '' ? null : DateTime.parse(json["release_date"]),
    title: json["title"] == null ? null :json["title"]!,
    video: json["video"] == null ? null : json["video"]!,
    voteAverage: json["vote_average"]  == null ? null : json["vote_average"]!.toDouble(),
    voteCount: json["vote_count"] == null ? null : json["vote_count"]!,
    firstAirDate: json["first_air_date"] == null || json["first_air_date"] == '' ? null :  DateTime.parse(json["first_air_date"]),
    name: json["name"] == null ? null : json["name"]!,
    originCountry: json["origin_country"] == null ? null : List<String>.from(json["origin_country"].map((x) => x)),
    originalName: json["original_name"] == null  ? null : json["original_name"]! ,
    gender: json["gender"] == null ? null : json["gender"]!,
    knownFor: json["known_for"] == null ? null : List<KnownFor>.from(json["known_for"].map((x) => KnownFor.fromJson(x))),
    knownForDepartment: json["known_for_department"] == null ? null : json["known_for_department"]!,
    profilePath: json["profile_path"] == null ? null : json["profile_path"]!,
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "genre_ids": genreIds ?? List<dynamic>.from(genreIds!.map((x) => x)),
    "id": id,
    "media_type": mediaTypeValues.reverse![mediaType],
    "original_language": originalLanguage == null ? null : originalLanguageValues.reverse![originalLanguage],
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "release_date": releaseDate == null ? null : "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
    "first_air_date": firstAirDate == null ? null : "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
    "name": name,
    "origin_country": originCountry == null ? null : List<dynamic>.from(originCountry!.map((x) => x)),
    "original_name": originalName,
    "gender": gender,
    "known_for": knownFor == null ? null : List<dynamic>.from(knownFor!.map((x) => x.toJson())),
    "known_for_department": knownForDepartment,
    "profile_path": profilePath,
  };
}

class KnownFor {
  KnownFor({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  MediaType? mediaType;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  factory KnownFor.fromJson(Map<String, dynamic> json) => KnownFor(
    adult: json["adult"] == null ? null : json["adult"]!,
    backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"]!,
    genreIds: json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"] == null ? null : json["id"]!,
    mediaType: mediaTypeValues.map[json["media_type"]] == null ? null :  mediaTypeValues.map[json["media_type"]]!,
    originalLanguage: json["original_language"] == null ? null : json["original_language"]!,
    originalTitle: json["original_title"] == null ? null : json["original_title"]!,
    overview: json["overview"] == null ? null : json["overview"]!,
    posterPath: json["poster_path"] == null ? null : json["poster_path"]!,
    releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]!),
    title: json["title"] == null ? null : json["title"]!,
    video: json["video"] == null ? null :json["video"]! ,
    voteAverage: json["vote_average"]== null ? null : json["vote_average"].toDouble()!,
    voteCount: json["vote_count"] == null ? null : json["vote_count"]!,
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
    "id": id,
    "media_type": mediaTypeValues.reverse![mediaType],
    "original_language": originalLanguage,
    "original_title": originalTitle,
    "overview": overview,
    "poster_path": posterPath,
    "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}

enum MediaType { MOVIE, TV, PERSON }

final mediaTypeValues = EnumValues({
  "movie": MediaType.MOVIE,
  "person": MediaType.PERSON,
  "tv": MediaType.TV
});

enum OriginalLanguage { EN, JA, TH }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "ja": OriginalLanguage.JA,
  "th": OriginalLanguage.TH
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
