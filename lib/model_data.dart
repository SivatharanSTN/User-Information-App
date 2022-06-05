class ModelData {
  String? name;
  String? avatar;

  ModelData({this.name, this.avatar});
  factory ModelData.fromJson(Map<String, dynamic> json) {
    return ModelData(
      name: json["name"] ?? "",
      avatar: json["avatar"] ?? "",
    );
  }
}
