class PopularResponse {
  final String name;

  PopularResponse.fromJson(Map<String, dynamic> json) : name = json['name'];
}
