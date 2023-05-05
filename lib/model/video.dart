import 'dart:convert';

List<Video> videoFromJson(String str) => List<Video>.from(json.decode(str).map((x) => Video.fromJson(x)));

String videoToJson(List<Video> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Video {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final String name;
  final String path;
  final dynamic playlists;

  Video({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.name,
    required this.path,
    required this.playlists,
  });

  Video copyWith({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? name,
    String? path,
    dynamic playlists,
  }) =>
      Video(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        name: name ?? this.name,
        path: path ?? this.path,
        playlists: playlists ?? this.playlists,
      );

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    id: json["ID"],
    createdAt: DateTime.parse(json["CreatedAt"]),
    updatedAt: DateTime.parse(json["UpdatedAt"]),
    deletedAt: json["DeletedAt"],
    name: json["name"],
    path: json["path"],
    playlists: json["Playlists"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "CreatedAt": createdAt.toIso8601String(),
    "UpdatedAt": updatedAt.toIso8601String(),
    "DeletedAt": deletedAt,
    "name": name,
    "path": path,
    "Playlists": playlists,
  };
}
