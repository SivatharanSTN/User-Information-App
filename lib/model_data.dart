class ModelData {
  String? name;
  String? avatar;
  Profile? profile;

  ModelData({
    this.name,
    this.avatar,
    this.profile,
  });
  factory ModelData.fromJson(Map<String, dynamic> json) {
    return ModelData(
      name: json["name"] ?? "",
      avatar: json["avatar"] ?? "",
      profile: Profile.fromJson(json["profile"]),
    );
  }
}

class Profile {
  String? firstName;
  String? lastName;
  int? age;

  Profile({this.firstName, this.lastName, this.age});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
      age: json["age"] ?? 0,
    );
  }
}
