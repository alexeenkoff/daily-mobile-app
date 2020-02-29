class TagResponse {
  final String name;

  TagResponse.fromJson(Map<String, dynamic> json) : name = json['name'];
}
