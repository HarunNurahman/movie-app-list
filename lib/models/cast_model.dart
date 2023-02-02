class CastModel {
  String? name;
  String? profilePath;
  String? character;

  CastModel({
    this.name,
    this.profilePath,
    this.character,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        name: json['name'],
        profilePath: json['profile_path'],
        character: json['character'],
      );
}
